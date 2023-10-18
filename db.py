import json
from datetime import datetime

import pyodbc
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("certificados-paygoal-db")


def execute_sp(db, cuit_agente, periodo, id_impuesto, cuit_contribuyente):
    global conexion
    if db == 'dev':
        conexion = establecer_conexion_dev()
    elif db == 'replica':
        conexion = establecer_conexion_replica()

    if conexion:
        logger.info("La conexión a la base de datos se estableció correctamente." + db)
        cursor = conexion.cursor()
        logger.info(
            f"EXEC SP WithholdingCertificatesByShop {db} {cuit_agente} {periodo} {id_impuesto} {cuit_contribuyente}")

        cursor.execute('EXEC WithholdingCertificatesByShop ?, ?, ?, ?', cuit_agente, periodo, id_impuesto,
                       cuit_contribuyente)
        resultado = cursor.fetchall()
        cursor.close()
        conexion.close()
        certs_str = ''

        if resultado:
            for i in range(len(resultado)):
                certs_str += str(resultado[i])
        certs_str = certs_str.replace('\',), (\'', '')
        certs_str = certs_str.replace('\',)', '')
        certs_str = certs_str.replace('(\'', '')
        certs_str = certs_str.replace(r"\'", "'")
        certs_str = certs_str.replace(r'\"', '"')
        certs_str = certs_str.replace(r'\\/', '/')

        with open('input_data/' + cuit_agente + '_' + periodo + '_' + db + '.txt', 'w',
                  encoding='utf-8') as archivo:
            archivo.write(certs_str)
        return certs_str
    else:
        logger.info("La conexión a la base de datos no se pudo establecer.")


def establecer_conexion_replica():
    try:
        # Configura la cadena de conexión
        server = 'localhost'
        database = 'PaygoalWHT'
        username = 'admin'
        password = 'w)7m!=_8V}'

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


def establecer_conexion_dev():
    try:
        # Configura la cadena de conexión
        server = 'localhost'
        database = 'PaygoalWHT_dev'
        username = 'admin'
        password = '!=_8V}w)7m'

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
