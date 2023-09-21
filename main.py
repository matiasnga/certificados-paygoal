import pdfkit
import read_file
import os
import time

lista_certificados = read_file.read_file("demo_cert.xlsx")
tiempo_inicio_proceso = time.time()

pdf_options = read_file.pdf_options()

html_to_pdf = ""
with open("template/certificado_template.html", "r") as f:
    template_html = f.read()

for i, certificado in enumerate(lista_certificados):
    tiempo_inicio_iteracion = time.time()
    Titulo1 = str(certificado["Titulo1"])
    html_to_pdf = (
        template_html.replace("{{ Titulo1 }}", str(certificado["Titulo1"]))
        .replace("{{ RazonSocial }}", str(certificado["RazonSocial"]))
        .replace("{{ Direccion }}", str(certificado["Direccion"]))
        .replace("{{ CodigoPostal }}", str(certificado["CodigoPostal"]))
        .replace("{{ Localidad }}", str(certificado["Localidad"]))
        .replace("{{ Provincia }}", str(certificado["Provincia"]))
        .replace("{{ Fecha }}", str(certificado["Fecha"]))
        .replace("{{ CUITAgente }}", str(certificado["CUITAgente"]))
        .replace("{{ NroIIBB }}", str(certificado["NroIIBB"]))
        .replace("{{ RazonSocialContribuyente }}", str(certificado["RazonSocialContribuyente"]))
        .replace("{{ DireccionContribuyente }}", str(certificado["DireccionContribuyente"]))
        .replace("{{ CodigoPostalContribuyente }}", str((certificado["CodigoPostalContribuyente"])).removesuffix(".0"))
        .replace("{{ LocalidadContribuyente }}", str(certificado["LocalidadContribuyente"]))
        .replace("{{ ProvinciaContribuyente }}", str(certificado["ProvinciaContribuyente"]))
        .replace("{{ CUITContribuyente }}", str(certificado["CUITContribuyente"]))
        .replace("{{ NroCertificado }}", str(certificado["NroCertificado"]))
        .replace("{{ Impuesto }}", str(certificado["Impuesto"]))
        .replace("{{ Condicion }}", str(certificado["Condicion"]))
        .replace("{{ EnPalabras }}", str(certificado["EnPalabras"]))
        .replace("{{ Referencia }}", str(certificado["Referencia"]))
        .replace("{{ IdAgrupacionRetenciones }}", str(certificado["IdAgrupacionRetenciones"]))
        .replace("{{ NombreApoderado }}", str(certificado["NombreApoderado"]))
        .replace("{{ WithholdingAmount }}", str(certificado["WithholdingAmount"]))
    )

    cuit_sin_guines = ''.join([caracter for caracter in str(certificado["CUITContribuyente"]) if caracter != "-"])

    output_path = "output/" + cuit_sin_guines + "/"

    if not os.path.exists(output_path):
        os.makedirs(output_path)

    pdfkit.from_string(html_to_pdf,
                       output_path + str(certificado["Impuesto"]) + " - " + str(certificado["NroCertificado"]) + ".pdf",
                       options=pdf_options)

    tiempo_fin_iteracion = time.time()
    tiempo_iteracion = tiempo_fin_iteracion - tiempo_inicio_iteracion

    print("PDF #" + str(i + 1) + " de " + str(len(lista_certificados)) + " generado exitosamente. Tiempo de ejecución = " + str(round(tiempo_iteracion, 2)) + " segundos")
#
archivo_html = "output.html"

# Guarda el contenido HTML en un archivo
with open(archivo_html, "w", encoding="utf-8") as archivo:
    archivo.write(html_to_pdf)

tiempo_fin_proceso = time.time()
tiempo_total_proceso_minutos = (tiempo_fin_proceso - tiempo_inicio_proceso) / 60

print(f"Tiempo total del proceso = {tiempo_total_proceso_minutos:.2f} minutos")

print("--------------------")
