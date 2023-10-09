import zipfile

import pdfkit
import os
from jinja2 import Template
from tqdm import tqdm
import db
import logging
import shutil

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("certificados-paygoal")

cuit_agente = '30716829436'
periodo = '202310'
id_impuesto = None
cuit_contribuyente = None

lista_certificados = db.execute_sp(cuit_agente, periodo, id_impuesto, cuit_contribuyente)

for certificado in tqdm(lista_certificados, desc="Generando certificados"):
    output_path = "output/" + certificado['CUITContribuyente'].replace("-", "") + "/"
    output_file = str(certificado["Impuesto"]) + " - " + certificado["NroCertificado"] + ".pdf"

    # Crea el directorio de salida si no existe
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Abre el template HTML
    with open("template/certificado_template.html", "r", encoding='utf-8') as certificado_template:
        template = Template(certificado_template.read())

    # Obtiene la imagen de la firma desde el CUITagente
    certificado['firma_src'] = './template/Firma_' + certificado['CUITAgente'].replace("-", "") + '.png'

    # Inserta el certificado en el HTML
    html_template = template.render(**certificado)

    # Guarda el contenido HTML en un archivo temporal
    with open('temp.html', 'w', encoding='utf-8') as f:
        f.write(html_template)

    # Genera el archivo PDF
    pdf_options = {
        'page-size': 'A4',
        'margin-top': '20mm',
        'margin-right': '0mm',
        'margin-bottom': '0mm',
        'margin-left': '20mm',
        'encoding': "UTF-8",
        'enable-local-file-access': '',
        'title': output_file,
        'no-outline': None,
        'zoom': 1.2,
    }

    pdfkit.from_file('temp.html', output_path + output_file, options=pdf_options)

    # Elimina el archivo temporal HTML
    os.remove("temp.html")

logger.info('Comprimiendo archivos...')
archivo_zip = 'output/certificados_' + cuit_agente + '_' + periodo
shutil.make_archive(archivo_zip, 'zip', 'output/')
archivo_zip = archivo_zip + '.zip'


def contar_archivos_pdf(zip_file):
    cantidad_archivos_pdf = 0
    tamano_zip = os.path.getsize(archivo_zip)

    for info in zip_file.infolist():
        # Verifica que el archivo tenga la extensión .pdf (ignora carpetas)
        if not info.is_dir() and info.filename.lower().endswith('.pdf'):
            cantidad_archivos_pdf += 1

    return cantidad_archivos_pdf, tamano_zip


def obtener_tamano_descomprimido(zip_file):
    tamano_descomprimido = 0

    for info in zip_file.infolist():
        tamano_descomprimido += info.file_size

    return tamano_descomprimido


with zipfile.ZipFile(archivo_zip, 'r') as zip_file:
    cantidad_archivos, tamano_zip = contar_archivos_pdf(zip_file)
    tamano_descomprimido = obtener_tamano_descomprimido(zip_file)

# Muestra la información
logger.info(f'Nombre del archivo ZIP: {archivo_zip}')
logger.info(f'Cantidad de archivos PDF contenidos: {cantidad_archivos}')
logger.info(f'Tamaño total del ZIP: {round((tamano_zip / 1024), 2)} KB')
logger.info(f'Tamaño descomprimido total: {round((tamano_descomprimido / 1024), 2)} KB')
logger.info(f'Tamaño promedio de certificado: {round(((tamano_descomprimido / cantidad_archivos) / 1024), 2)} KB')

logger.info('*** PROCESO FINALIZADO ***')
