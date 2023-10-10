import db
import utils
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger('certificados-paygoal')

ambiente = 'replica'
cuit_agente = '30716829436'
periodo = '202309'
id_impuesto = None
cuit_contribuyente = None
#
output_path = 'certificados/' + cuit_agente + '/' + periodo
output_zip = 'certificados/' + cuit_agente


# db.execute_sp(ambiente, cuit_agente, periodo, id_impuesto, cuit_contribuyente)
lista_certificados = utils.open_json('input_data/sp_data_30716829436_202309_replica.txt')
logger.info(lista_certificados)

archivo_zip = output_path + '/certificados.zip'
#
utils.generate_pdf(lista_certificados, output_path)

# utils.generar_zip(output_zip, archivo_zip)

# utils.analizar_zip(archivo_zip)
# carpeta1 = "certificados_QA/node/"
# carpeta2 = "certificados_QA/python/"
#
# # Obtén una lista de archivos en la carpeta 1
# archivos_carpeta1 = os.listdir(carpeta1)
#
# # Itera sobre la lista de archivos y compara cada par de archivos
# for nombre_archivo in archivos_carpeta1:
#     archivo1 = os.path.join(carpeta1, nombre_archivo)
#     archivo2 = os.path.join(carpeta2, nombre_archivo)
#
#     if os.path.isfile(archivo2):
#         son_iguales = utils.comparar_pdf(archivo1, archivo2)
#
#         # Haz algo con el resultado 'son_iguales', por ejemplo, imprimirlo
#         logger.info(f'Son iguales? {son_iguales}')
#     else:
#         logger.info(f'El archivo {nombre_archivo} no existe en {carpeta2}')


logger.info('*** PROCESO FINALIZADO ***')
