import utils
import os
import db
import logging
import shutil

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("certificados-paygoal")
while True:
    entrada = input("Presione 1 para generar 'MODO' o 2 para generar 'PAYWAY': ")
    if entrada == "1":
        cuit_agente = "30716829436"
        break  # Sal del bucle si la entrada es válida
    elif entrada == "2":
        cuit_agente = "30598910045"
        break  # Sal del bucle si la entrada es válida
    else:
        print("Entrada no válida. Intente nuevamente.")

periodo = input("Ingrese periodo yyyyMM")

id_impuesto = input("Ingrese ID de impuesto")
cuit_contribuyente = input("Ingrese CUIT del contribuyente")


lista_certificados = db.execute_sp(cuit_agente, periodo, id_impuesto, cuit_contribuyente)

output_path = "output/" + cuit_agente + '/' + periodo

if os.path.exists(output_path):
    shutil.rmtree(output_path)

utils.generate_pdf(lista_certificados, output_path)

logger.info('Comprimiendo archivos...')
archivo_zip = output_path + '/certificados_' + cuit_agente + '_' + periodo


shutil.make_archive(archivo_zip, 'zip', output_path)
archivo_zip = archivo_zip + '.zip'

utils.analizar_zip(archivo_zip)

logger.info('*** PROCESO FINALIZADO ***')
