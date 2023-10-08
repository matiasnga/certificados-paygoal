import pdfkit
import os
import time
import json
from jinja2 import Template
import pyodbc
from dotenv import load_dotenv

# Carga las variables de entorno desde el archivo .env
load_dotenv()

# Obtén las variables de entorno
db_server = os.getenv('DB_SERVER')
db_database = os.getenv('DB_DATABASE')
db_username = os.getenv('DB_USERNAME')
db_password = os.getenv('DB_PASSWORD')


def establecer_conexion():
    try:
        # Configura la cadena de conexión
        server = db_server
        database = db_database
        username = db_username
        password = db_password

        # Crea la cadena de conexión
        conn = pyodbc.connect(
            'DRIVER={SQL Server};'
            f'SERVER={server};'
            f'DATABASE={database};'
            f'UID={username};'
            f'PWD={password};'
        )

        return conn
    except pyodbc.Error as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None


# Intenta establecer la conexión
conexion = establecer_conexion()
data_dict = dict
# Verifica si la conexión se estableció correctamente
if conexion:
    print("La conexión se estableció correctamente.")
    cursor = conexion.cursor()
    cursor.execute('EXEC GetJsonData')
    resultado = cursor.fetchone()[0]

    # Imprime el resultado
    print(resultado)
    data_dict = json.loads(resultado)

    # Cierra el cursor y la conexión
    cursor.close()
    # Aquí puedes continuar con la ejecución de tu código, incluida la ejecución del procedimiento almacenado.
else:
    print("La conexión no se pudo establecer. Revise la configuración de conexión.")


# def read_json_file():
#     with open('input/demo_cert_json_1.json', 'r', encoding='utf-8') as file:
#         data_dict = json.load(file)
#     return data_dict


tiempo_inicio_proceso = time.time()
lista_certificados = data_dict

# Recorre la lista de certificados

for i, certificado in enumerate(lista_certificados):
    tiempo_inicio_iteracion = time.time()
    cuit = certificado['CUITContribuyente'].replace("-", "")
    withholdingGroupingId = certificado['CUITContribuyente']
    output_path = "output/" + cuit + "/"
    output_file = str(certificado["Impuesto"]) + " - " + certificado["NroCertificado"] + ".pdf"
    titulo_pdf = output_file

    # Crea el directorio de salida si no existe
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Abre el template HTML desde un archivo
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
    # Genera el archivo PDF
    pdfkit.from_file('temp.html', output_path + output_file, options=pdf_options)

    # Elimina el archivo temporal HTML
    os.remove("temp.html")

    tiempo_fin_iteracion = time.time()
    tiempo_iteracion = tiempo_fin_iteracion - tiempo_inicio_iteracion

    print("PDF #" + str(i + 1) + " de " + str(
        len(lista_certificados)) + " generado exitosamente. Tiempo de ejecución = " + str(
        round(tiempo_iteracion, 2)) + " segundos")

tiempo_fin_proceso = time.time()
tiempo_total_proceso_minutos = (tiempo_fin_proceso - tiempo_inicio_proceso) / 60

print(f"Tiempo total del proceso = {tiempo_total_proceso_minutos:.2f} minutos")
print("--------------------")
