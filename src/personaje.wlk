import wollok.game.*
import direcciones.*

class Personaje {
	var property position =  game.center()

	method image() {
		return "personajes/personaje.png"
	}
	
	method moverse(direccion) {
		self.moverHaciaSiSePuede(self, direccion)
	}
	
	method moverHaciaSiSePuede(personaje, direccion) {
		if(direccion.puedeIr(personaje)){
			self.moverHacia(personaje, direccion)
		}
	}
	
	method moverHacia(personaje, direccion) {
		const nuevaPosicion = direccion.posicion(personaje.position())
		if(self.puedeMoverse(nuevaPosicion)){
			personaje.orientacion(direccion)
			personaje.position(nuevaPosicion)
		}
		
	}
	
	method puedeMoverse(posicion) = posicion.allElements().all({objeto => objeto.esAtravesable()})
}


object jugador inherits Personaje (position = game.at(3,1)) {
	
	var property energia = 100
	var property orientacion = derecha
	
	method esAtravesable() = true
}
