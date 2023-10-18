import datetime
import re


def cuit_agente_input():
    cuit_agente = input(
        "Seleccione el agente: \n [1] MODO (30716829436) \n [2] PAYWAY (30717664406)\n [3] PayGoal (30716589575)\n")

    if cuit_agente == '1':
        return '30716829436'
    elif cuit_agente == '2':
        return '30717664406'
    elif cuit_agente == '3':
        return '30716589575'
    else:
        print('Opcion invalida. Intente Nuevamente\n')
        return cuit_agente_input()


def periodo_input():
    patron = r'^\d{4}(0[1-9]|1[0-2])$'
    ultimo_periodo_cerrado = int(datetime.datetime.now().strftime("%Y%m")) - 1
    periodo = input(f"Ingrese periodo en formato yyyyMM (por defecto {ultimo_periodo_cerrado})")
    if periodo == '':
        return str(ultimo_periodo_cerrado)
    else:
        if re.match(patron, periodo):
            return str(periodo)
        else:
            print(f"El periodo {periodo} no cumple con el formato yyyyMM. \n ")
        return periodo_input()


def user_input():
    return cuit_agente_input(), periodo_input()
