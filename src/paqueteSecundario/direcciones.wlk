import individuos.*
import paquetePrimario.configuracion.*
import wollok.game.*

class Direccion{

	var property nombre

	method orientar(individuo, posicion){
		individuo.orientacion(self)
	}

	method posicion(posicion)

	method puedeIr(individuo) = self.posicion(individuo.position()).allElements().all({elemento => elemento.esAtravesable()})
	
	method objetosEnLaPosicionDelIndividuo(individuo){
		return game.getObjectsIn(game.at(individuo.position().x(), individuo.position().y()))
	}
	
	method objetosFrentreAlIndividuo(individuo){
		return game.getObjectsIn(game.at(self.posicion(individuo.position()).x(), self.posicion(individuo.position())).y())
	}
	
	method enemigosFrenteAlIndividuo(individuo) {
		const objects = self.objetosFrentreAlIndividuo(individuo)
		return objects.filter{ unObjeto => unObjeto.categoria() == 'enemigo' }
	}

}

object arriba inherits Direccion(nombre="Espalda"){

	override method posicion(posicion) = posicion.up(1)

}
 
 
object abajo inherits Direccion(nombre="Frente"){

	override method posicion(posicion) = posicion.down(1)

}


object derecha inherits Direccion(nombre="Derecha"){

	override method posicion(posicion) = posicion.right(1)

} 


object izquierda  inherits Direccion(nombre="Izquierda"){

	override method posicion(posicion) = posicion.left(1)

}