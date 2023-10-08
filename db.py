import json
import pyodbc
from dotenv import load_dotenv
import os
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("certificados-paygoal-db")

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


def execute_sp(cuit_agente, periodo, id_impuesto, cuit_contribuyente):
    conexion = establecer_conexion()

    if conexion:
        logger.info("La conexión a la base de datos se estableció correctamente.")
        cursor = conexion.cursor()
        cursor.execute('EXEC WithholdingCertificatesByShop ?, ?, ?, ?', cuit_agente, periodo, id_impuesto,
                       cuit_contribuyente)
        resultado = cursor.fetchone()[0]
        lista_certificados = json.loads(resultado)
        # Cierra el cursor y la conexión
        cursor.close()
        conexion.close()
        return lista_certificados
    else:
        logger.info("La conexión a la base de datos no se pudo establecer.")
