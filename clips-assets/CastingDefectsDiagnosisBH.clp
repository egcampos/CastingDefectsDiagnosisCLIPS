;
; Cavidad Template
;

(deftemplate Cavidad
	(multislot aspecto
		(type SYMBOL)
		(allowed-values
			liso
			dendritico
			rugoso
		)
	)
	(multislot color
		(type SYMBOL)
		(allowed-values
			negruzco
			amarronado
			rojizo
			dorado
			plateado
		)
	)
	(slot acabado
		(type SYMBOL)
		(allowed-values
			mate
			brillante
		)
	)
	(slot forma
		(type STRING)
		(allowed-strings
			"Irregular alargada"
			"Irregular redonda"
			"Irregular cuadrada"
			"Cilíndrica alargada"
			"Cilíndrica corta"
			"Cónica"
			"Esférica"
			"Redondeada"
		)
	)
	(slot tamaño
		(type STRING)
		(allowed-strings
			"Pequeño"
			"Mediano"
			"Grande"
			"Muy grande"
		)
	)
	(slot cantidad
		(type SYMBOL)
		(allowed-values
			una
			pocas
			muchas
			muchisimas
		)
	)
	(slot distribución
		(type STRING)
		(allowed-values
			"Única"
			"Alineadas rectas"
			"Alineadas circulares"
			"Azarosas"
		)
	)
	(slot ubicación
		(type STRING)
		(allowed-strings
			"Semi-molde superior"
			"Superficie definida por noyo o lado sobre"
			"Semi-molde inferior"
			"No definida (dispersas en zonas)"
			"En toda la pieza"
		)
	)
	(slot posición
		(type STRING)
		(allowed-strings
			"En la superficie"
			"Subsuperficial"
			"Próximas a enfriadores"
			"Sobre un vértice interior"
			"En el centro del espesor"
			"Sobre ataques de colada"
			"Intersección de secciones a 90°"
			"Próximas cuello de montante"
			"Dentro del cuello del montante"
		)
	)

)

;
; Diagnostico Template
;

(deftemplate Diagnostico
	(slot subfamilia
		(type STRING)
		(allowed-strings
			"B-111: Sopladuras pinholes"
			"B-112: Sopladuras"
			"B-113: Sopladuras por escoria"
			"B-121: Sopladuras superficiales"
			"B-122: Sopladura por ángulo vivo"
			"B-123: Pinhole de superficie"
			"B-124: Rechupe disperso"
			"B-211: Rechupe abierto o externo"
			"B-212: Rechupe en ángulos o bordes"
			"B-213: Rechupe por noyo"
			"B-221: Rechupe interno o ciego"
			"B-222: Rechupe central"
			"B-311: Micro-rechupe"
		)
	)
	(multislot causas
		(type STRING)
		(allowed-strings
			"Humedad de los materias de inoculación"
			"Tenor de Aluminio en metal (ref. menor a 0.02%)"
			"Humedad de la masa de moldeo y su permeabilidad"
			"Elementos carbonaceos en la masa de moldeo"
			"Fase de secado de la pintura, tanto en base agua como alcohol, no terminada"
			"Posible exceso de aglomerante"
			"Noyos sin salidas de aire o respiraderos a la atmosfera"

			"Falta de limpieza de enfriadores/soportines"
			"Condensación de humedad sobre enfriadores/soportines (puede darse por colocar partes frías y calientes dentro del molde)"
			"Enfriadores con superficies porosas o agrietamiento superficial en la cara de contacto con el metal colado"

			"Metal no limpio, asegure la limpieza del metal antes de volcarlo en el molde puede usar atrapa escorias, son provistos por muchos proveedores"
			"Reacciones no deseadas entre el metal y los revestimientos de hornos y cucharas o partes del molde"
			"Molde no limpio antes del ensamble definitivo (aspire preferentemente)"
			"Llenado turbulento"
			"Temperatura incorrecta"
			"En hierro: relación magnesio/azufre menor a 4"


		)
	)
)

;
; Rules
;

(defrule R-B-111
	(Cavidad
		(aspecto liso)
		(color plateado)
		(acabado brillante)
		(forma "Redondeada")
		(tamaño ?t)
		(cantidad muchisimas)
		(distribución "Azarosas")
		(ubicación "En toda la pieza")
		(posición "En la superficie")
	)
	(test (or (eq ?t "Pequeño") (eq ?t "Mediano")))
	=>
	(assert
		(Diagnostico
			(subfamilia "B-111: Sopladuras pinholes")
			(causas
				"Humedad de los materias de inoculación"
				"Tenor de Aluminio en metal (ref. menor a 0.02%)"
				"Humedad de la masa de moldeo y su permeabilidad"
				"Elementos carbonaceos en la masa de moldeo"
				"Fase de secado de la pintura, tanto en base agua como alcohol, no terminada"
				"Posible exceso de aglomerante"
				"Noyos sin salidas de aire o respiraderos a la atmosfera"
			)
		)
	)
)

(defrule R-B-112
	(Cavidad
		(aspecto liso)
		(color rojizo dorado)
		(acabado brillante)
		(forma "Irregular alargada")
		(tamaño "Mediano")
		(cantidad pocas)
		(Distribución "Azarosas")
		(Ubicación "Semi-molde superior")
		(Posición "Próximas a enfriadores")
	)
	=>
	(assert
		(Diagnostico
			(subfamilia "B-112: Sopladuras")
			(causas
				"Falta de limpieza de enfriadores/soportines"
				"Condensación de humedad sobre enfriadores/soportines (puede darse por colocar partes frías y calientes dentro del molde)"
				"Enfriadores con superficies porosas o agrietamiento superficial en la cara de contacto con el metal colado"
			)
		)
	)
)

(defrule R-B-113
	(Cavidad
		(aspecto liso rugoso)
		(color negruzco)
		(acabado mate)
		(AND (forma "Irregular alargada") (forma "Irregular redonda"))
		(tamaño "Mediano")
		(cantidad pocas)
		(Distribución "Azarosas")
		(Ubicación "Semi-molde superior")
		(Posición "En la superficie")
	)
	=>
	(assert
		(Diagnostico
			(subfamilia "B-113: Sopladuras por escoria")
			(causas
				"Metal no limpio, asegure la limpieza del metal antes de volcarlo en el molde puede usar atrapa escorias, son provistos por muchos proveedores"
				"Reacciones no deseadas entre el metal y los revestimientos de hornos y cucharas o partes del molde"
				"Molde no limpio antes del ensamble definitivo (aspire preferentemente)"
				"Llenado turbulento"
				"Temperatura incorrecta"
				"En hierro: relación magnesio/azufre menor a 4"
			)
		)
	)
)

(defrule R-B-121
	(Cavidad
		(aspecto liso)
		(color negruzco)
		(acabado mate)
		(forma "Irregular redonda")
		(tamaño "Grande")
		(cantidad muchas)
		(Distribución "Azarosas")
		(Ubicación "Semi-molde superior")
		(Posición "En la superficie")
	)
	=>
	(assert
		(Diagnostico
			(subfamilia "B-121: Sopladuras superficiales")
			(causas
				"Gas atrapado en los sistemas de salida de aire, principalmente en las partes más altas del semi-molde superior"
				"Temperatura de llenado baja"
				"Llenado lento y turbulento"
				"Baja permeabilidad del molde"
				"Posible exceso de aglomerante o compactación"
			)
		)
	)
)