import personas.*
import cervezas.*

class Carpa {
	var property limiteGente // cantidad de gente -> numerico
	var property bandaMusicaTradicional // si hay una banda -> booleano
	var property marca // marca que representa la carpa -> objeto de clase MarcaCerveza
	const property personasDentro = []
	const property jarrasAVender = []
	
	method stockear(jarra) { 
		if (jarra.marca() == self.marca()) {
			jarra.carpa(self) // 14.- requerimiento
			jarrasAVender.add(jarra)
		}
	}
	// 5.- requerimiento
	method quiereEntrar(laPersona) {
		return laPersona.leGusta(marca) and 
		(self.bandaMusicaTradicional() == laPersona.escuchaMusicaTradicional())
		or laPersona.quiereEntrar(self)
	}
	// 6.- requerimiento
	method dejarEntrar(laPersona) {
		return (personasDentro.size() <= self.limiteGente()) and not laPersona.estaEbrio()
	}
	// 7.- requerimiento 
	method puedeEntrar(laPersona) {
		return laPersona.quiereEntrar(self)
	}
	// 8.- requerimiento
	method ingresa(laPersona) { 
		if (personasDentro.size() <= self.limiteGente()) {
			personasDentro.add(personasDentro)
		} else {
			self.error("No entras por gato")
		}
	}
	// 9.- requerimiento
	method estaEstaEnLaCapar(laPersona) {
		return personasDentro.contains(laPersona)
	}
	method vender(jarra,laPersona) {
		if ((not jarrasAVender.isEmpty()) and (self.estaEstaEnLaCapar(laPersona))) {
			jarrasAVender.remove(jarra)
			laPersona.comprar(jarra)
		} else { self.error("No hay birras para vos") }
	}
	// 10.- requerimiento
	method ebrioEmpedernidos() {
		return personasDentro.count( { laPersona => laPersona.esEbrioEmpedernido() } )
	}
	// 11.- requerimiento
	method esPatriota(laPersona) {
		return laPersona.esPatriota()
	}
	// 12.- requerimiento
	method sonCompatibles(otraPersona) {
		return personasDentro.any( { persona => persona.esCompatible(otraPersona) } )
	}
	// 13.- requerimiento
	method esHomogenea() { 
		return personasDentro.filter( { persona => persona.paisOrigen() } ).asSet().size() > 1
	}
	// 15.- requerimiento
	method personasALasQueNoSeLeVendio() {
		return personasDentro.filter( { laPersona => laPersona.enCarpasLeSirvieronCerveza().all( { jarra => jarra.carpa() != self  } ) } )
	}
}
