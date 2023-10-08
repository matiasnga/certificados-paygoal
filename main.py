import pdfkit
import os
import time
import json
from jinja2 import Template
import db
import logging
import shutil
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("certificados-paygoal")

# Intenta establecer la conexión
conexion = db.establecer_conexion()
# Crea diccionario de certificados
lista_certificados = dict
cuit_agente = '30716829436'
periodo = '202310'
id_impuesto = None
cuit_contribuyente = None

# Verifica si la conexión se estableció correctamente y ejecuta el store procedure
if conexion:
    logger.info("La conexión a la base de datos se estableció correctamente.")
    cursor = conexion.cursor()
    cursor.execute('EXEC WithholdingCertificatesByShop ?, ?, ?, ?', cuit_agente, periodo, id_impuesto, cuit_contribuyente)
    resultado = cursor.fetchone()[0]
    lista_certificados = json.loads(resultado)
    logging.info("Cantidad de certificados: " + str(len(lista_certificados)))
    # Cierra el cursor y la conexión
    cursor.close()
    conexion.close()
else:
    logger.info("La conexión a la base de datos no se pudo establecer.")


tiempo_inicio_proceso = time.time()

# Recorre la lista de certificados

for i, certificado in enumerate(lista_certificados):
    tiempo_inicio_iteracion = time.time()
    output_path = "output/" + certificado['CUITContribuyente'].replace("-", "") + "/"
    output_file = str(certificado["Impuesto"]) + " - " + certificado["NroCertificado"] + ".pdf"

    # Crea el directorio de salida si no existe
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Abre el template HTML
    with open("template/certificado_template.html", "r", encoding='utf-8') as template_file:
        template_html = template_file.read()
        template = Template(template_html)

    certificado['firma_src'] = './template/Firma_' + certificado['CUITAgente'].replace("-", "") + '.png'
    # Renderizar la plantilla con los datos
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

    tiempo_fin_iteracion = time.time()
    tiempo_iteracion = tiempo_fin_iteracion - tiempo_inicio_iteracion

    logger.info("PDF #" + str(i + 1) + " de " + str(
        len(lista_certificados)) + " generado exitosamente. Tiempo de ejecución = " + str(
        round(tiempo_iteracion, 2)) + " segundos")

tiempo_fin_proceso = time.time()
tiempo_total_proceso_minutos = (tiempo_fin_proceso - tiempo_inicio_proceso) / 60
logger.info('Comprimiendo archivos...')
shutil.make_archive('output/certificados', 'zip', 'output/')

logger.info(f"Tiempo total del proceso = {tiempo_total_proceso_minutos:.2f} minutos")
