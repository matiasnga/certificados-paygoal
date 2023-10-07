import pandas as pd
import pdfkit
import os
import time
import json
from jinja2 import Template

pdf_options = {
    'page-size': 'A4',
    'margin-top': '20mm',
    'margin-right': '0mm',
    'margin-bottom': '0mm',
    'margin-left': '20mm',
    'encoding': "UTF-8",
    'enable-local-file-access': '',
    'title': 'None',
    'no-outline': None,
    'zoom': 1.2,
}
def read_json_file():
    with open('input/demo_cert_json_1.json', 'r', encoding='utf-8') as file:
        data_dict = json.load(file)
    return data_dict


def read_excel_file():
    excel_file = "input/demo_cert.xlsx"
    data = pd.read_excel(excel_file)
    return data.to_dict(orient="records")


tiempo_inicio_proceso = time.time()
# lista_certificados = read_excel_file()
lista_certificados = read_json_file()



# Recorre la lista de certificados
for i, certificado in enumerate(lista_certificados):
    tiempo_inicio_iteracion = time.time()
    cuit = ''.join([caracter for caracter in str(certificado["CUITContribuyente"]) if caracter != "-"])
    output_path = "output/" + cuit + "/"
    output_file = str(certificado["Impuesto"]) + " - " + str(
        certificado["NroCertificado"]) + ".pdf"
    titulo_pdf = output_file

    # Crea el directorio de salida si no existe
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Abre el template HTML desde un archivo
    with open("template/certificado_template.html", "r", encoding='utf-8') as template_file:
        template_html = template_file.read()
        template = Template(template_html)

    # Renderizar la plantilla con los datos
    # Inserta el certificado en el HTML
    html_template = template.render(**certificado)

    # Guarda el contenido HTML en un archivo temporal
    with open('temp.html', 'w', encoding='utf-8') as f:
        f.write(html_template)

    # Genera el archivo PDF
    pdfkit.from_file('temp.html', output_path + output_file, options=pdf_options)

    # Elimina el archivo temporal HTML
    # os.remove("temp.html")

    tiempo_fin_iteracion = time.time()
    tiempo_iteracion = tiempo_fin_iteracion - tiempo_inicio_iteracion

    print("PDF #" + str(i + 1) + " de " + str(
        len(lista_certificados)) + " generado exitosamente. Tiempo de ejecución = " + str(
        round(tiempo_iteracion, 2)) + " segundos")

tiempo_fin_proceso = time.time()
tiempo_total_proceso_minutos = (tiempo_fin_proceso - tiempo_inicio_proceso) / 60

print(f"Tiempo total del proceso = {tiempo_total_proceso_minutos:.2f} minutos")
print("--------------------")
