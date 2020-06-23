

class MarcaCerveza {
	var property pais // pais origen -> objeto pais
	var property lupulo // cantidad gramos x litro -> numerico  
	
	method graduacion()
}

class Rubia inherits MarcaCerveza {
	var property graduacion // porcentaje de alcohol x litro -> numerico Ej. 0.1 litro
	
	method graduacion(porcentaje) { graduacion = porcentaje }
}

class Negra inherits MarcaCerveza {
	var property graduacionMundial
	
	override method graduacion() { return self.graduacionMundial().min(lupulo * 2) }
}

class Roja inherits Negra {
	
	override method graduacion() { return super() * 1.25 }
}

object graduacionReglamentaria {
	var property nivel // porcentaje de alcohol x litro ->
}

class Jarras {
	var property litros // cantidad litros -> numerico
	var property marca // marca cerveza -> tipo cerveza
	// 14.- requerimiento
	var property carpa = "ninguna" // carpa donde se vendio la jarra 
	
	method cantidadAlcohol() { 
		return litros * self.graduacionAlcohol()
	}	
	method graduacionAlcohol() { return  marca.graduacion() }
}

class Pais {
	var property nombre // nombre de pais -> string
	var property gentilicio // gentilicio de las personas de origen -> string
}