from xhtml2pdf import pisa
from io import BytesIO

# Ruta del archivo XHTML en el disco
xhtml_file_path = "temp.html"

# Ruta donde deseas guardar el archivo PDF
output_pdf_path = "ejemplo.pdf"

# Ruta del archivo CSS en el disco (si tienes uno)
css_file_path = "template/style.css"


# Función para convertir el archivo XHTML en PDF con estilo CSS
def convert_xhtml_to_pdf_with_css(xhtml_path, pdf_path, css_path=None):
    with open(xhtml_path, "rb") as xhtml_file, open(pdf_path, "wb") as pdf_file:
        if css_path:
            pisa.CreatePDF(xhtml_file, pdf_file, path=css_path)
        else:
            pisa.CreatePDF(xhtml_file, pdf_file)


# Convertir el archivo XHTML en PDF con estilo CSS
convert_xhtml_to_pdf_with_css(xhtml_file_path, output_pdf_path, css_file_path)
