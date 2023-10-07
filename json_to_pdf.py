from jinja2 import Template


def read_json_file():
    with open('input/demo_cert_json.json', 'r') as file:
        data_dict = json.load(file)
    return data_dict


# Plantilla HTML utilizando Jinja2
html_template = """
<!DOCTYPE html>
<html>
<head>
    <title>Certificado de Retención</title>
</head>
<body>
    <h1>{{ Titulo1 }}</h1>
    <p>Razón Social: {{ RazonSocial }}</p>
    <!-- Otros campos de datos... -->

    <h2>Retenciones:</h2>
    <table>
        <thead>
            <tr>
                <th>TaxRegimeId</th>
                <th>TaxRegime</th>
                <th>BaseRetencion</th>
                <th>Alicuota</th>
                <th>Retencion</th>
            </tr>
        </thead>
        <tbody>
            {% for retencion in Retenciones %}
            <tr>
                <td>{{ retencion['TaxRegimeId'] }}</td>
                <td>{{ retencion['TaxRegime'] }}</td>
                <td>{{ retencion['BaseRetencion'] }}</td>
                <td>{{ retencion['Alicuota'] }}</td>
                <td>{{ retencion['Retencion'] }}</td>
            </tr>
            {% endfor %}
        </tbody>
    </table>
</body>
</html>
"""

# Compilar la plantilla
template = Template(html_template)

# Renderizar la plantilla con los datos
output_html = template.render(**certificado)

# Guardar el HTML generado en un archivo HTML temporal
with open('certificado_retencion.html', 'w') as file:
    file.write(output_html)
