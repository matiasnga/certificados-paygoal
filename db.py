import json
from datetime import datetime

import pyodbc
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("certificados-paygoal-db")


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


def execute_sp(db, cuit_agente, periodo, id_impuesto, cuit_contribuyente):
    global conexion

    if db == 'dev':
        conexion = establecer_conexion_dev()
    elif db == 'replica':
        conexion = establecer_conexion_replica()

    if conexion:
        logger.info("La conexión a la base de datos se estableció correctamente." + db)
        cursor = conexion.cursor()
        cursor.execute('EXEC WithholdingCertificatesByShop ?, ?, ?, ?', cuit_agente, periodo, id_impuesto,
                       cuit_contribuyente)
        resultado = cursor.fetchall()

        # Inicializa una cadena para concatenar los resultados
        concatenated_result = ""
        print(len(resultado))
        i = 0
        lista_certificados = ''
        # Itera a través de las filas y concatena el contenido
        for i in range(len(resultado)):
            row = str(resultado[i])[2:-3]
            # Concatena el contenido de cada fila
            lista_certificados += row
            i += 1
        with open('input_data/sp_data_' + cuit_agente + '_' + periodo + '_' + db + '.txt', 'w', encoding='utf-8') as archivo:
            archivo.write(lista_certificados)

        print(f"El string se ha guardado en el archivo sp_data.txt.")
        lista_certificados_str = json.loads(str(lista_certificados))

        # Cierra el cursor y la conexión
        cursor.close()
        conexion.close()
        return lista_certificados_str
    else:
        logger.info("La conexión a la base de datos no se pudo establecer.")
