import individuos.*
import paquetePrimario.configuracion.*

class Direccion{

	var property nombre

	method orientar(individou, posicion){
		individou.orientacion(self)
	}

	method posicion(posicion)

	method puedeIr(individou) = self.posicion(individou.position()).allElements().all({elemento => elemento.esAtravesable()})

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