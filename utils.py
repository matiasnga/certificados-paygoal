import json
import os
import logging
import shutil
import zipfile
from jinja2 import Template
import pdfkit
from tqdm import tqdm

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("certificados-paygoal")


def open_json(archivo):
    with open(archivo, 'r', encoding='utf-8') as archivo_json:
        resultado = archivo_json.read()
        return json.loads(resultado)


def generate_pdf(lista_certificados, output_path):
    if os.path.exists(output_path):
        shutil.rmtree(output_path)
    for certificado in tqdm(lista_certificados, desc="Generando certificados"):
        if certificado['IdAgrupacionRetenciones']:
            output_path_file = output_path + '/' + certificado['IdAgrupacionRetenciones'] + '/' + certificado[
                'CUITContribuyente'].replace("-", "") + "/"
        else:
            output_path_file = output_path + '/' + certificado['CUITContribuyente'].replace("-", "") + "/"
        output_file = str(certificado["Impuesto"]) + " - " + certificado["NroCertificado"] + ".pdf"

        # Crea el directorio de salida si no existe
        if not os.path.exists(output_path_file):
            os.makedirs(output_path_file)

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
            'margin-bottom': '10mm',
            'margin-left': '20mm',
            'encoding': "UTF-8",
            'enable-local-file-access': '',
            'title': output_file,
            'no-outline': None,
            'footer-left': 'Página [page]/[topage]',
            'footer-font-size': 9,
            'zoom': 1.2,
        }

        pdfkit.from_file('temp.html', output_path_file + output_file, options=pdf_options)

        # Elimina el archivo temporal HTML
        os.remove("temp.html")


def generar_zip(path, archivo_zip):
    with zipfile.ZipFile(archivo_zip, 'w', zipfile.ZIP_DEFLATED) as zip_file:
        # Itera a través de los archivos y carpetas dentro de la carpeta
        for carpeta_actual, subcarpetas, archivos in tqdm(os.walk(path), desc="Generando archivo zip"):
            for archivo in archivos:
                # Obtiene la ruta completa del archivo
                ruta_completa = os.path.join(carpeta_actual, archivo)
                # Agrega el archivo al archivo ZIP
                if archivo.lower().endswith('.pdf'):
                    # Agrega el archivo al archivo ZIP
                    zip_file.write(ruta_completa, os.path.relpath(ruta_completa, path))
    logger.info(f"Se ha creado el archivo ZIP '{archivo_zip}'")


def analizar_zip(archivo):
    cantidad_archivos_pdf = 0
    size_unzipped = 0
    tamano_zip = os.path.getsize(archivo)
    with zipfile.ZipFile(archivo, 'r') as zip_file:
        for info in zip_file.infolist():
            size_unzipped += info.file_size
        for info in zip_file.infolist():
            if not info.is_dir() and info.filename.lower().endswith('.pdf'):
                cantidad_archivos_pdf += 1
    logger.info(f'Nombre del archivo ZIP: {archivo}')
    logger.info(f'Cantidad de archivos PDF contenidos: {cantidad_archivos_pdf}')
    logger.info(f'Tamaño total del ZIP: {round((tamano_zip / 1024), 2)} KB')
    logger.info(f'Tamaño descomprimido total: {round((size_unzipped / 1024), 2)} KB')
    logger.info(f'Tamaño promedio de certificado: {round(((size_unzipped / cantidad_archivos_pdf) / 1024), 2)} KB')
