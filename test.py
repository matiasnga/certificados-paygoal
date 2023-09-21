import pdfkit
import imgkit
import os


def generar_pdf(diccionario, nombre_archivo):
    # Lee el contenido del archivo HTML
    with open('test.html', 'r', encoding='utf-8') as template_file:
        html_template = template_file.read()

    # Reemplaza las variables en el template HTML
    html_template = html_template.format(**diccionario)

    # Genera el archivo HTML temporal
    with open('temp.html', 'w', encoding='utf-8') as f:
        f.write(html_template)

    # Convierte el HTML en PDF
    pdfkit.from_file('temp.html', nombre_archivo, options={"enable-local-file-access": ""})

    # Elimina el archivo HTML temporal


# Ejemplo de datos y generación de PDF
datos = {
    'titulo': 'Título del PDF',
    'contenido': 'Contenido del PDF',
    'imagen': 'img.jpg'  # Reemplaza con la ruta de tu imagen
}

generar_pdf(datos, 'ejemplo.pdf')
