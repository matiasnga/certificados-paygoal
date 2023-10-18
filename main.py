import json
import db
import utils
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger('certificados-paygoal')

cuit_agente = '30716829436'
periodo = '202309'
ambiente = 'replica'
id_impuesto = None
cuit_contribuyente = None

output_path = 'certificados/' + ambiente + '/' + cuit_agente + '/' + periodo
output_zip = 'certificados/' + ambiente + '/' + cuit_agente
archivo_zip = output_path + '/certificados.zip'

lista_certificados = db.execute_sp(ambiente, cuit_agente, periodo, id_impuesto, cuit_contribuyente)
lista_certificados = json.loads(lista_certificados)

# lista_certificados = utils.open_json('input_data/sp_data_str_30716829436_202309_replica.txt')

utils.generate_pdf(lista_certificados, output_path)

utils.generar_zip(output_zip, archivo_zip)

utils.analizar_zip(archivo_zip)

logger.info('*** PROCESO FINALIZADO ***')
