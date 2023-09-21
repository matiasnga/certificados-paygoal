import pandas as pd


def read_file(archivo):
    excel_file = "input/" + archivo
    data = pd.read_excel(excel_file)
    return data.to_dict(orient="records")


def pdf_options():
    return {
        'page-size': 'A4',
        'margin-top': '25mm',
        'margin-right': '0mm',
        'margin-bottom': '0mm',
        'margin-left': '25mm',
        'encoding': "UTF-8",
        'enable-local-file-access': '',

        # Ajustar la escala para que se ajuste a la página
        'zoom': 1.2,
    }
