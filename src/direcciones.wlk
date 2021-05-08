import individuo.*
import configuraciones.*

object arriba {
	method nombre() = "Espalda"
	
	method posicion(posicion) = posicion.up(1)
	
	method puedeIr(personaje) = self.posicion(personaje.position()).allElements().all({elemento => elemento.esAtravesable()})
	
	method orientar(personaje, posicion){
	}
}
 
 
object abajo {
	method nombre() = "DeFrente"
	
	method posicion(posicion) = posicion.down(1)
	
	method puedeIr(personaje) = self.posicion(personaje.position()).allElements().all({elemento => elemento.esAtravesable()})
	
	method orientar(personaje, posicion){
	}
}


object derecha {
	method nombre() = "Derecha"
	
	method posicion(posicion) = posicion.right(1)
	
	method puedeIr(personaje) = self.posicion(personaje.position()).allElements().all({elemento => elemento.esAtravesable()})
	
	method orientar(personaje, posicion) {
		personaje.orientacion(self)
	}	
} 


object izquierda {
	method nombre() = "Izquierda"
	
	method posicion(posicion) = posicion.left(1)
	
	method puedeIr(personaje) = self.posicion(personaje.position()).allElements().all({elemento => elemento.esAtravesable()})
	
	method orientar(personaje, posicion) {
		personaje.orientacion(self)
	}
}


