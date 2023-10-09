CREATE PROCEDURE WithholdingCertificatesByShop
@companyId bigint = null,
@period int = null,
@taxId smallint = null,
@shopId bigint = null,
@toJson bit = 1

AS
BEGIN
    DECLARE @jsonResult NVARCHAR(MAX)
    SET @jsonResult = '[
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Santiago del Estero",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 1",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-00000002-8",
		"NroCertificado":"23199221000000000001",
		"Impuesto":900,
		"Condicion":"Servicios no presenciales W",
		"EnPalabras":"En palabras: Pesos argentinos, diecisiete mil quinientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"3,50 %",
				"Retencion":"$ 17.500,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"",
				"Retencion":"$ 17.500,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"FRIGORIFICO GENERAL DEHEZA SA",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"30-55019602-2",
		"NroCertificado":"2319000000000001",
		"Impuesto":901,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"31",
				"TaxRegime":"Servicios de pagos, plataformas y aplicaciones informáticas",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 8.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Corrientes",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"ZACARIAS JOSE",
		"DireccionContribuyente":"25 DE MAYO 180",
		"CodigoPostalContribuyente":"3416",
		"LocalidadContribuyente":"SAN LORENZO",
		"ProvinciaContribuyente":"CORRIENTES",
		"CUITContribuyente":"20-08478543-2",
		"NroCertificado":"231900000001",
		"Impuesto":905,
		"Condicion":"Contribuyente local",
		"EnPalabras":"En palabras: Pesos argentinos, diez con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"2",
				"TaxRegime":"Operaciones realizadas a través de sitios web",
				"BaseRetencion":"$ 500,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 10,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500,00",
				"Alicuota":"",
				"Retencion":"$ 10,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"EL REMEDIO SH DE CUETO VALENTI",
		"DireccionContribuyente":"25 DE MAYO 2838 Piso:5 Dpto:a",
		"CodigoPostalContribuyente":"3000",
		"LocalidadContribuyente":"SANTA FE",
		"ProvinciaContribuyente":"SANTA FE",
		"CUITContribuyente":"30-69234350-2",
		"NroCertificado":"2319001500000001",
		"Impuesto":767,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"15",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 2.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"EL REMEDIO SH DE CUETO VALENTI",
		"DireccionContribuyente":"25 DE MAYO 2838 Piso:5 Dpto:a",
		"CodigoPostalContribuyente":"3000",
		"LocalidadContribuyente":"SANTA FE",
		"ProvinciaContribuyente":"SANTA FE",
		"CUITContribuyente":"30-69234350-2",
		"NroCertificado":"2319006900000001",
		"Impuesto":217,
		"Condicion":"Sociedad de Hecho",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"69",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 2.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SUCESORES DE ROBERTO SAMAN SOC",
		"DireccionContribuyente":"25 MAYO 239",
		"CodigoPostalContribuyente":"4423",
		"LocalidadContribuyente":"CHICOANA",
		"ProvinciaContribuyente":"SALTA",
		"CUITContribuyente":"30-56351657-3",
		"NroCertificado":"2319001600000001",
		"Impuesto":767,
		"Condicion":"Estación de servicios",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"16",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito – Sujetos Anexo I RG N° 2.854 y estaciones de servicio",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"1,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SUCESORES DE ROBERTO SAMAN SOC",
		"DireccionContribuyente":"25 MAYO 239",
		"CodigoPostalContribuyente":"4423",
		"LocalidadContribuyente":"CHICOANA",
		"ProvinciaContribuyente":"SALTA",
		"CUITContribuyente":"30-56351657-3",
		"NroCertificado":"2319007000000001",
		"Impuesto":217,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"70",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"1,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SUCESORES DE ROBERTO SAMAN SOC",
		"DireccionContribuyente":"25 MAYO 239",
		"CodigoPostalContribuyente":"4423",
		"LocalidadContribuyente":"CHICOANA",
		"ProvinciaContribuyente":"SALTA",
		"CUITContribuyente":"30-56351657-3",
		"NroCertificado":"23199010000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación W",
		"EnPalabras":"En palabras: Pesos argentinos, catorce mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"3,50 %",
				"Retencion":"$ 14.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 14.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"LUIS Y MIGUEL ZANNIELLO SACI",
		"DireccionContribuyente":"9 Y 12 RUTA 8 KM 60 0",
		"CodigoPostalContribuyente":"1629",
		"LocalidadContribuyente":"PILAR",
		"ProvinciaContribuyente":"BUENOS AIRES",
		"CUITContribuyente":"30-50028803-1",
		"NroCertificado":"2319000000000001",
		"Impuesto":901,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"31",
				"TaxRegime":"Servicios de pagos, plataformas y aplicaciones informáticas",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 8.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos La Pampa",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"CARLOS KARABITIAN S.A.",
		"DireccionContribuyente":"AV. VALPARAISO 4815",
		"CodigoPostalContribuyente":"5016",
		"LocalidadContribuyente":"BARRIO INAUDI",
		"ProvinciaContribuyente":"CORDOBA",
		"CUITContribuyente":"30-71337290-7",
		"NroCertificado":"23199110000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación O",
		"EnPalabras":"En palabras: Pesos argentinos, sesenta con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 5.000,00",
				"Alicuota":"1,20 %",
				"Retencion":"$ 60,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 5.000,00",
				"Alicuota":"",
				"Retencion":"$ 60,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SUCESION DE BLANCH BENJAMIN LU",
		"DireccionContribuyente":"AV. VELEZ SARSFIELD 6551",
		"CodigoPostalContribuyente":"5017",
		"LocalidadContribuyente":"BARRIO COMERCIAL",
		"ProvinciaContribuyente":"CORDOBA",
		"CUITContribuyente":"20-08000621-8",
		"NroCertificado":"2319001500000001",
		"Impuesto":767,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil cuarenta y uno con 66\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"15",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 8.793,38",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.041,66"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 8.793,38",
				"Alicuota":"",
				"Retencion":"$ 2.041,66"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SUCESION DE BLANCH BENJAMIN LU",
		"DireccionContribuyente":"AV. VELEZ SARSFIELD 6551",
		"CodigoPostalContribuyente":"5017",
		"LocalidadContribuyente":"BARRIO COMERCIAL",
		"ProvinciaContribuyente":"CORDOBA",
		"CUITContribuyente":"20-08000621-8",
		"NroCertificado":"2319006900000001",
		"Impuesto":217,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil cuarenta y uno con 66\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"69",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 8.793,38",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.041,66"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 8.793,38",
				"Alicuota":"",
				"Retencion":"$ 2.041,66"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Córdoba",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SUCESION DE BLANCH BENJAMIN LU",
		"DireccionContribuyente":"AV. VELEZ SARSFIELD 6551",
		"CodigoPostalContribuyente":"5017",
		"LocalidadContribuyente":"BARRIO COMERCIAL",
		"ProvinciaContribuyente":"CORDOBA",
		"CUITContribuyente":"20-08000621-8",
		"NroCertificado":"23199040000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación U",
		"EnPalabras":"En palabras: Pesos argentinos, diez mil doscientos ocho con 31\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 408.332,68",
				"Alicuota":"2,50 %",
				"Retencion":"$ 10.208,31"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 408.332,68",
				"Alicuota":"",
				"Retencion":"$ 10.208,31"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"JOHNSON ACERO S. A. INDUSTRIAL",
		"DireccionContribuyente":"AVDA ALMAFUERTE 3658",
		"CodigoPostalContribuyente":"3100",
		"LocalidadContribuyente":"PARANA",
		"ProvinciaContribuyente":"ENTRE RIOS",
		"CUITContribuyente":"30-50199107-0",
		"NroCertificado":"2319001700000001",
		"Impuesto":767,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, doce mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"17",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito – Sujetos No comprendidos en el Anexo I RG N° 2.854",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"3,00 %",
				"Retencion":"$ 12.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 12.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"JOHNSON ACERO S. A. INDUSTRIAL",
		"DireccionContribuyente":"AVDA ALMAFUERTE 3658",
		"CodigoPostalContribuyente":"3100",
		"LocalidadContribuyente":"PARANA",
		"ProvinciaContribuyente":"ENTRE RIOS",
		"CUITContribuyente":"30-50199107-0",
		"NroCertificado":"2319007000000001",
		"Impuesto":217,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"70",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"1,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"JOHNSON ACERO S. A. INDUSTRIAL",
		"DireccionContribuyente":"AVDA ALMAFUERTE 3658",
		"CodigoPostalContribuyente":"3100",
		"LocalidadContribuyente":"PARANA",
		"ProvinciaContribuyente":"ENTRE RIOS",
		"CUITContribuyente":"30-50199107-0",
		"NroCertificado":"23199010000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación G",
		"EnPalabras":"En palabras: Pesos argentinos, un mil seiscientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"0,40 %",
				"Retencion":"$ 1.600,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 1.600,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"JOHNSON ACERO S. A. INDUSTRIAL",
		"DireccionContribuyente":"AVDA ALMAFUERTE 3658",
		"CodigoPostalContribuyente":"3100",
		"LocalidadContribuyente":"PARANA",
		"ProvinciaContribuyente":"ENTRE RIOS",
		"CUITContribuyente":"30-50199107-0",
		"NroCertificado":"2319000000000001",
		"Impuesto":901,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"31",
				"TaxRegime":"Servicios de pagos, plataformas y aplicaciones informáticas",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 8.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"VELVET DINNER S.R.L.",
		"DireccionContribuyente":"BORGES JORGE LUIS 1689",
		"CodigoPostalContribuyente":"1414",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-71737674-5",
		"NroCertificado":"2319001500000001",
		"Impuesto":767,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil setenta y nueve con 8\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"15",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 18.290,00",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.079,08"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 18.290,00",
				"Alicuota":"",
				"Retencion":"$ 2.079,08"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"VELVET DINNER S.R.L.",
		"DireccionContribuyente":"BORGES JORGE LUIS 1689",
		"CodigoPostalContribuyente":"1414",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-71737674-5",
		"NroCertificado":"2319006900000001",
		"Impuesto":217,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil setenta y nueve con 8\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"69",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 18.290,00",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.079,08"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 18.290,00",
				"Alicuota":"",
				"Retencion":"$ 2.079,08"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"VELVET DINNER S.R.L.",
		"DireccionContribuyente":"BORGES JORGE LUIS 1689",
		"CodigoPostalContribuyente":"1414",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-71737674-5",
		"NroCertificado":"2319000000000001",
		"Impuesto":901,
		"Condicion":"Alícuotas diferenciales 7",
		"EnPalabras":"En palabras: Pesos argentinos, dieciseis mil seiscientos treinta y dos con 60\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"28",
				"TaxRegime":"Padrón de Alícuotas Diferenciales",
				"BaseRetencion":"$ 415.815,00",
				"Alicuota":"4,00 %",
				"Retencion":"$ 16.632,60"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 415.815,00",
				"Alicuota":"",
				"Retencion":"$ 16.632,60"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Tucumán",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"ÑAÑEZ WALTER ALEXIS",
		"DireccionContribuyente":"BUENOS AIRES 26 Piso:2 Dpto:C",
		"CodigoPostalContribuyente":"3315",
		"LocalidadContribuyente":"LEANDRO N. ALEM",
		"ProvinciaContribuyente":"MISIONES",
		"CUITContribuyente":"20-25672045-1",
		"NroCertificado":"23199240000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación V",
		"EnPalabras":"En palabras: Pesos argentinos, cinco mil novecientos noventa y nueve con 97\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 199.999,00",
				"Alicuota":"3,00 %",
				"Retencion":"$ 5.999,97"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 199.999,00",
				"Alicuota":"",
				"Retencion":"$ 5.999,97"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Tucumán",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"ÑAÑEZ WALTER ALEXIS",
		"DireccionContribuyente":"BUENOS AIRES 26 Piso:2 Dpto:C",
		"CodigoPostalContribuyente":"3315",
		"LocalidadContribuyente":"LEANDRO N. ALEM",
		"ProvinciaContribuyente":"MISIONES",
		"CUITContribuyente":"20-25672045-1",
		"NroCertificado":"231900000001",
		"Impuesto":924,
		"Condicion":"Convenio multilateral",
		"EnPalabras":"En palabras: Pesos argentinos, veinticinco con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"6",
				"TaxRegime":"Tarjetas de crédito y similares",
				"BaseRetencion":"$ 100.000,00",
				"Alicuota":"0,25 %",
				"Retencion":"$ 25,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 100.000,00",
				"Alicuota":"",
				"Retencion":"$ 25,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Santa Fe",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"VINILAR S.A.S.",
		"DireccionContribuyente":"COCHABAMBA 1460",
		"CodigoPostalContribuyente":"5013",
		"LocalidadContribuyente":"BARRIO PUEYRREDON",
		"ProvinciaContribuyente":"CORDOBA",
		"CUITContribuyente":"30-71705528-0",
		"NroCertificado":"23199210000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación V",
		"EnPalabras":"En palabras: Pesos argentinos, trescientos treinta con 3\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 11.001,00",
				"Alicuota":"3,00 %",
				"Retencion":"$ 330,03"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 11.001,00",
				"Alicuota":"",
				"Retencion":"$ 330,03"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Santa Fe",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"VINILAR S.A.S.",
		"DireccionContribuyente":"COCHABAMBA 1460",
		"CodigoPostalContribuyente":"5013",
		"LocalidadContribuyente":"BARRIO PUEYRREDON",
		"ProvinciaContribuyente":"CORDOBA",
		"CUITContribuyente":"30-71705528-0",
		"NroCertificado":"231900000001",
		"Impuesto":921,
		"Condicion":"Convenio multilateral",
		"EnPalabras":"En palabras: Pesos argentinos, quince con 1\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"516",
				"TaxRegime":"Servicios de gestión de pagos y cobros",
				"BaseRetencion":"$ 1.001,00",
				"Alicuota":"1,50 %",
				"Retencion":"$ 15,01"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 1.001,00",
				"Alicuota":"",
				"Retencion":"$ 15,01"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"ÑAÑA  SUJ S.A.",
		"DireccionContribuyente":"CORRIENTES 610 Piso:3 Dpto:B",
		"CodigoPostalContribuyente":"4000",
		"LocalidadContribuyente":"SAN MIGUEL DE TUCUMAN",
		"ProvinciaContribuyente":"TUCUMAN",
		"CUITContribuyente":"33-70954048-9",
		"NroCertificado":"2319007100000001",
		"Impuesto":217,
		"Condicion":"IVA Exento",
		"EnPalabras":"En palabras: Pesos argentinos, cuatrocientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"71",
				"TaxRegime":"Sujetos Exentos o no alcanzados en IVA",
				"BaseRetencion":"$ 19.999,99",
				"Alicuota":"2,00 %",
				"Retencion":"$ 400,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 19.999,99",
				"Alicuota":"",
				"Retencion":"$ 400,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Tucumán",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"ÑAÑA  SUJ S.A.",
		"DireccionContribuyente":"CORRIENTES 610 Piso:3 Dpto:B",
		"CodigoPostalContribuyente":"4000",
		"LocalidadContribuyente":"SAN MIGUEL DE TUCUMAN",
		"ProvinciaContribuyente":"TUCUMAN",
		"CUITContribuyente":"33-70954048-9",
		"NroCertificado":"231900000001",
		"Impuesto":924,
		"Condicion":"Contribuyente local",
		"EnPalabras":"En palabras: Pesos argentinos, quinientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"6",
				"TaxRegime":"Tarjetas de crédito y similares",
				"BaseRetencion":"$ 10.000,00",
				"Alicuota":"5,00 %",
				"Retencion":"$ 500,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 10.000,00",
				"Alicuota":"",
				"Retencion":"$ 500,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"TODOLI ALBERTO",
		"DireccionContribuyente":"JUSTO JUAN B AV. 637 Piso:6",
		"CodigoPostalContribuyente":"1425",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"20-01820499-2",
		"NroCertificado":"2319001500000001",
		"Impuesto":767,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil con 50\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"15",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 400.100,00",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.000,50"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.100,00",
				"Alicuota":"",
				"Retencion":"$ 2.000,50"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"TODOLI ALBERTO",
		"DireccionContribuyente":"JUSTO JUAN B AV. 637 Piso:6",
		"CodigoPostalContribuyente":"1425",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"20-01820499-2",
		"NroCertificado":"2319006900000001",
		"Impuesto":217,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil con 50\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"69",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 400.100,00",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.000,50"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.100,00",
				"Alicuota":"",
				"Retencion":"$ 2.000,50"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Santa Fe",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"TODOLI ALBERTO",
		"DireccionContribuyente":"JUSTO JUAN B AV. 637 Piso:6",
		"CodigoPostalContribuyente":"1425",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"20-01820499-2",
		"NroCertificado":"231900000001",
		"Impuesto":921,
		"Condicion":"Inscripto en extraña jurisdicción",
		"EnPalabras":"En palabras: Pesos argentinos, dieciocho mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"516",
				"TaxRegime":"Servicios de gestión de pagos y cobros",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"4,50 %",
				"Retencion":"$ 18.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 18.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"BERTOLIN JUAN CARLOS",
		"DireccionContribuyente":"MONTEVIDEO 969",
		"CodigoPostalContribuyente":"7000",
		"LocalidadContribuyente":"TANDIL",
		"ProvinciaContribuyente":"BUENOS AIRES",
		"CUITContribuyente":"20-11138728-2",
		"NroCertificado":"2319001600000001",
		"Impuesto":767,
		"Condicion":"Agente Retención IVA",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"16",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito – Sujetos Anexo I RG N° 2.854 y estaciones de servicio",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"1,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"BERTOLIN JUAN CARLOS",
		"DireccionContribuyente":"MONTEVIDEO 969",
		"CodigoPostalContribuyente":"7000",
		"LocalidadContribuyente":"TANDIL",
		"ProvinciaContribuyente":"BUENOS AIRES",
		"CUITContribuyente":"20-11138728-2",
		"NroCertificado":"2319007000000001",
		"Impuesto":217,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"70",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"1,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"BERTOLIN JUAN CARLOS",
		"DireccionContribuyente":"MONTEVIDEO 969",
		"CodigoPostalContribuyente":"7000",
		"LocalidadContribuyente":"TANDIL",
		"ProvinciaContribuyente":"BUENOS AIRES",
		"CUITContribuyente":"20-11138728-2",
		"NroCertificado":"23199010000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación T",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 8.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"WILNOR SA",
		"DireccionContribuyente":"OLAGUER Y FELIU V. 2545 Piso:4 Dpto:13",
		"CodigoPostalContribuyente":"1426",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-70756097-1",
		"NroCertificado":"2319001500000001",
		"Impuesto":767,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, dos mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"15",
				"TaxRegime":"Pagos efectuados por cualquier medio excepto tarjetas de crédito",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"0,50 %",
				"Retencion":"$ 2.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 2.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"WILNOR SA",
		"DireccionContribuyente":"OLAGUER Y FELIU V. 2545 Piso:4 Dpto:13",
		"CodigoPostalContribuyente":"1426",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-70756097-1",
		"NroCertificado":"23199010000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación M",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"1,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"WILNOR SA",
		"DireccionContribuyente":"OLAGUER Y FELIU V. 2545 Piso:4 Dpto:13",
		"CodigoPostalContribuyente":"1426",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-70756097-1",
		"NroCertificado":"2319000000000001",
		"Impuesto":901,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"31",
				"TaxRegime":"Servicios de pagos, plataformas y aplicaciones informáticas",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 8.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"RANDAZZO LUIS ANTONIO ESTEBAN",
		"DireccionContribuyente":"PASO DE LA PATRIA 5",
		"CodigoPostalContribuyente":"6620",
		"LocalidadContribuyente":"CHIVILCOY",
		"ProvinciaContribuyente":"BUENOS AIRES",
		"CUITContribuyente":"20-14159552-1",
		"NroCertificado":"2319007100000001",
		"Impuesto":217,
		"Condicion":"IVA Exento",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"71",
				"TaxRegime":"Sujetos Exentos o no alcanzados en IVA",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 8.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"MATTOLINI OSCAR LEANDRO",
		"DireccionContribuyente":"RODRIGUEZ PE#A 3200",
		"CodigoPostalContribuyente":"5511",
		"LocalidadContribuyente":"GENERAL GUTIERREZ",
		"ProvinciaContribuyente":"MENDOZA",
		"CUITContribuyente":"20-06890089-2",
		"NroCertificado":"2319001700000001",
		"Impuesto":767,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, doce mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"17",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito – Sujetos No comprendidos en el Anexo I RG N° 2.854",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"3,00 %",
				"Retencion":"$ 12.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 12.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"MATTOLINI OSCAR LEANDRO",
		"DireccionContribuyente":"RODRIGUEZ PE#A 3200",
		"CodigoPostalContribuyente":"5511",
		"LocalidadContribuyente":"GENERAL GUTIERREZ",
		"ProvinciaContribuyente":"MENDOZA",
		"CUITContribuyente":"20-06890089-2",
		"NroCertificado":"2319007000000001",
		"Impuesto":217,
		"Condicion":"Responsable Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"70",
				"TaxRegime":"Pagos efectuados con tarjetas de crédito",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"1,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"GALLO MATIAS NICOLAS",
		"DireccionContribuyente":"SAN MARTIN AV. 7464",
		"CodigoPostalContribuyente":"1419",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"20-31477522-9",
		"NroCertificado":"2319000000000001",
		"Impuesto":901,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, diez con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"31",
				"TaxRegime":"Servicios de pagos, plataformas y aplicaciones informáticas",
				"BaseRetencion":"$ 500,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 10,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500,00",
				"Alicuota":"",
				"Retencion":"$ 10,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Tucumán",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"INTELLILUTIONS S.R.L.",
		"DireccionContribuyente":"VIEL 480 Piso:4 Dpto:A",
		"CodigoPostalContribuyente":"1424",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-71570638-1",
		"NroCertificado":"23199240000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación F",
		"EnPalabras":"En palabras: Pesos argentinos, treinta con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 10.000,00",
				"Alicuota":"0,30 %",
				"Retencion":"$ 30,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 10.000,00",
				"Alicuota":"",
				"Retencion":"$ 30,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Tucumán",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"INTELLILUTIONS S.R.L.",
		"DireccionContribuyente":"VIEL 480 Piso:4 Dpto:A",
		"CodigoPostalContribuyente":"1424",
		"LocalidadContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"ProvinciaContribuyente":"CIUDAD AUTONOMA BUENOS AIRES",
		"CUITContribuyente":"30-71570638-1",
		"NroCertificado":"231900000001",
		"Impuesto":924,
		"Condicion":"Responsable No Inscripto",
		"EnPalabras":"En palabras: Pesos argentinos, setecientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"6",
				"TaxRegime":"Tarjetas de crédito y similares",
				"BaseRetencion":"$ 10.000,00",
				"Alicuota":"7,00 %",
				"Retencion":"$ 700,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 10.000,00",
				"Alicuota":"",
				"Retencion":"$ 700,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Santiago del Estero",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 1",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-00000002-8",
		"NroCertificado":"23199220000000000001",
		"Impuesto":900,
		"Condicion":"Servicios no presenciales W",
		"EnPalabras":"En palabras: Pesos argentinos, siete mil quinientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"1,50 %",
				"Retencion":"$ 7.500,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"",
				"Retencion":"$ 7.500,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Santa Fe",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE SANTA FE",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-02199573-9",
		"NroCertificado":"231900000001",
		"Impuesto":921,
		"Condicion":"Contribuyente local",
		"EnPalabras":"En palabras: Pesos argentinos, veinte con 2\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"516",
				"TaxRegime":"Servicios de gestión de pagos y cobros",
				"BaseRetencion":"$ 1.001,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 20,02"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 1.001,00",
				"Alicuota":"",
				"Retencion":"$ 20,02"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 3",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-04028846-6",
		"NroCertificado":"23199010000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación K",
		"EnPalabras":"En palabras: Pesos argentinos, ocho con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 999,99",
				"Alicuota":"0,80 %",
				"Retencion":"$ 8,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 999,99",
				"Alicuota":"",
				"Retencion":"$ 8,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 3",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-04028846-6",
		"NroCertificado":"2319000000000001",
		"Impuesto":901,
		"Condicion":"Alícuotas diferenciales 8",
		"EnPalabras":"En palabras: Pesos argentinos, veintidos con 50\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"28",
				"TaxRegime":"Padrón de Alícuotas Diferenciales",
				"BaseRetencion":"$ 500,00",
				"Alicuota":"4,50 %",
				"Retencion":"$ 22,50"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500,00",
				"Alicuota":"",
				"Retencion":"$ 22,50"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 2",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-06546225-8",
		"NroCertificado":"23199020000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación S",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil quinientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"1,70 %",
				"Retencion":"$ 8.500,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.500,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Catamarca",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 2",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-06546225-8",
		"NroCertificado":"23199030000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación S",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil quinientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"1,70 %",
				"Retencion":"$ 8.500,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.500,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 2",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-06546225-8",
		"NroCertificado":"23199010000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación S",
		"EnPalabras":"En palabras: Pesos argentinos, ocho mil quinientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"1,70 %",
				"Retencion":"$ 8.500,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"",
				"Retencion":"$ 8.500,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 7",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-13603291-8",
		"NroCertificado":"2319001800000001",
		"Impuesto":767,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, cinco mil doscientos cincuenta con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"18",
				"TaxRegime":"No acrediten condición frente al IVA",
				"BaseRetencion":"$ 50.000,00",
				"Alicuota":"10,50 %",
				"Retencion":"$ 5.250,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 50.000,00",
				"Alicuota":"",
				"Retencion":"$ 5.250,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 7",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"20-13603291-8",
		"NroCertificado":"2319007100000001",
		"Impuesto":217,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, un mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"71",
				"TaxRegime":"Sujetos Exentos o no alcanzados en IVA",
				"BaseRetencion":"$ 50.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 1.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 50.000,00",
				"Alicuota":"",
				"Retencion":"$ 1.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Santa Fe",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 9",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"27-33254457-3",
		"NroCertificado":"231900000001",
		"Impuesto":921,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, treinta y cinco mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"516",
				"TaxRegime":"Servicios de gestión de pagos y cobros",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"7,00 %",
				"Retencion":"$ 35.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 500.000,00",
				"Alicuota":"",
				"Retencion":"$ 35.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 3",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"30-12947136-7",
		"NroCertificado":"2319001800000001",
		"Impuesto":767,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, veintiuno con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"18",
				"TaxRegime":"No acrediten condición frente al IVA",
				"BaseRetencion":"$ 200,00",
				"Alicuota":"10,50 %",
				"Retencion":"$ 21,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 200,00",
				"Alicuota":"",
				"Retencion":"$ 21,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 3",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"30-12947136-7",
		"NroCertificado":"2319007100000001",
		"Impuesto":217,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"71",
				"TaxRegime":"Sujetos Exentos o no alcanzados en IVA",
				"BaseRetencion":"$ 200,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 4,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 200,00",
				"Alicuota":"",
				"Retencion":"$ 4,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto al Valor Agregado",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 8",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"30-20144090-0",
		"NroCertificado":"2319001800000001",
		"Impuesto":767,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, veintiun mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"18",
				"TaxRegime":"No acrediten condición frente al IVA",
				"BaseRetencion":"$ 200.000,00",
				"Alicuota":"10,50 %",
				"Retencion":"$ 21.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 200.000,00",
				"Alicuota":"",
				"Retencion":"$ 21.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Impuesto a las Ganancias",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"SIN NOMBRE 8",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"30-20144090-0",
		"NroCertificado":"2319007100000001",
		"Impuesto":217,
		"Condicion":"Habitualista",
		"EnPalabras":"En palabras: Pesos argentinos, cuatro mil con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"71",
				"TaxRegime":"Sujetos Exentos o no alcanzados en IVA",
				"BaseRetencion":"$ 200.000,00",
				"Alicuota":"2,00 %",
				"Retencion":"$ 4.000,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 200.000,00",
				"Alicuota":"",
				"Retencion":"$ 4.000,00"
			}
		]
	},
	{
		"Titulo1":"Certificado de Retención de Ingresos Brutos Ciudad de Buenos Aires",
		"RazonSocial":"PLAY DIGITAL SA",
		"Direccion":"LIBERTADOR DEL AV. 7208 Piso:4   T:II",
		"CodigoPostal":"1429",
		"Localidad":"CIUDAD AUTONOMA BUENOS AIRES",
		"Provincia":"CIUDAD AUTONOMA BUENOS AIRES",
		"Fecha":"15-10-2023",
		"CUITAgente":"30-71682943-6",
		"NroIIBB":30716829436,
		"RazonSocialContribuyente":"FRIGORIFICO GENERAL DEHEZA SA",
		"DireccionContribuyente":"",
		"CodigoPostalContribuyente":"",
		"LocalidadContribuyente":"",
		"ProvinciaContribuyente":"",
		"CUITContribuyente":"30-55019602-2",
		"NroCertificado":"23199010000000000001",
		"Impuesto":900,
		"Condicion":"Grupo recaudación E",
		"EnPalabras":"En palabras: Pesos argentinos, ochocientos con 0\/100.",
		"Referencia":"Período de Retenciones: OCTUBRE 2023 - 1era quincena",
		"NombreApoderado":"Martín Quiroga",
		"Retenciones":[
			{
				"TaxRegimeId":"0",
				"TaxRegime":"SIRTAC",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"0,20 %",
				"Retencion":"$ 800,00"
			},
			{
				"TaxRegimeId":"TOTAL",
				"TaxRegime":"",
				"BaseRetencion":"$ 400.000,00",
				"Alicuota":"",
				"Retencion":"$ 800,00"
			}
		]
	}
]'

    SELECT @jsonResult AS JsonResult
END
