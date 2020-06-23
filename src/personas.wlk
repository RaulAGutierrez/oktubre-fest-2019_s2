import cervezas.*
import carpas.*

class Persona {
	var property peso // cantidad x Kg -> numerico
	const property jarras = []  // lista de marcas de cervezas -> tipo lista -> tipo cervezas
	var property escuchaMusicaTradicional // Si escucha o no Musica -> booleano
	var property nivelAguante // cantidad de aguante de la persona -> numerico
	var property litrosAlcoholConsumidos = 0 // cantidad de litros -> numerico
	var property paisOrigen // pais de donde viene -> tipo pais 
	
	
	method comprar(jarra) { jarras.add(jarra) }
	method consumir(jarra) { 
		if (not jarras.isEmpty()) { 
			litrosAlcoholConsumidos = litrosAlcoholConsumidos + jarra.cantidadAlcohol()
			//jarras.remove(jarra)
		}	
	}
	method estaEbrio() { return (litrosAlcoholConsumidos * peso) > nivelAguante }
	method leGusta(marcaCerveza) { 
		return self.paisOrigen() == marcaCerveza.pais()
	}
	// 7.- requerimiento
	method quiereEntrar(carpa) {
		return carpa.quiereEntrar(self) and carpa.dejarEntrar(self) 
	}
	// 10.- requerimiento
	method esEbrioEmpedernido() { 
		return jarras.all( { jarra => jarra.litros() >= 10 } ) and self.estaEbrio()
	}
	// 11.- requerimiento
	method esPatriota() {
		return jarras.all( { cervesa => cervesa.pais() == self.paisOrigen() } )
	}
	// 12.- requerimiento
	method marcasCompradas() { 
		return jarras.filter( { jarra => jarra.marca() } ).asSet() // retorna conjunto (sin marcas repetidas)
	}
	method coinicidenciasDeMarcasCompradas(otraPersona) { 
		return self.marcasCompradas().intersection(otraPersona.marcasCompradas())
	}
	method diferenciasEntreMarcasCompradas(otraPersona) {
		return self.marcasCompradas().difference(otraPersona.marcasCompradas())
	}
	method esCompatible(otraPersona) {
		var salida = false 
		if (not otraPersona == self) { 
				salida = (self.coinicidenciasDeMarcasCompradas(otraPersona).size()) > (self.diferenciasEntreMarcasCompradas(otraPersona).size())  
		}
		return salida
	}
	// 14.- requerimiento
	method enCarpasLeSirvieronCerveza() {
		return jarras.filter( { jarra => jarra.carpa() } ).asSert()
	}
	// 16.- requerimiento
	method estaEntrandoEnElVicio(jarra) { 
		return jarra.litros() == jarras.last().litros()
	}
}

class Aleman inherits Persona { 
	
	override method leGusta(marcaCerveza) {
		return paisOrigen.gentilicio() == "aleman"
	}
	override method quiereEntrar(carpa) {
		return (self.paisOrigen().gentilicio() == "aleman") and ((carpa.personasDentro.size() % 2) == 0)  
	}
}

class Belga inherits Persona { 
	
	override method leGusta(marcaCerveza) {
		return paisOrigen.gentilicio() == "belga" and (marcaCerveza.lupulo() > 4)
	}
}

class Checo inherits Persona { 
	
	override method leGusta(marcaCerveza) {
		return paisOrigen.gentilicio() == "checo" and (marcaCerveza.graduacion() > 0.08)
	}
}
