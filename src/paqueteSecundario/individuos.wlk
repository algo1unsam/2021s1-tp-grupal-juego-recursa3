import wollok.game.*
import direcciones.*
import paquetePrimario.imagen.*

class Individuo inherits Imagen {

	var property orientacion = derecha
	var property vida = 100
	var property armadura = null
	var property mano1 = null
	var property mano2 = null

	method moverse(direccion) {
		self.moverHaciaSiSePuede(self, direccion)
	}

	method moverHaciaSiSePuede(personaje, direccion) {
		if (direccion.puedeIr(personaje)) {
			self.moverHacia(personaje, direccion)
		}
	}

	method moverHacia(personaje, direccion) {
		const nuevaPosicion = direccion.posicion(personaje.position())
		if (self.puedeMoverse(nuevaPosicion)) {
			personaje.orientacion(direccion)
			personaje.position(nuevaPosicion)
		}
	}

	method puedeMoverse(posicion) = posicion.allElements().all({ objeto => objeto.esAtravesable() })

	method atacar() {
	}

}

object personaje inherits Individuo (position = game.at(1, 1), imagen = "individuo/personaje.png") {

	var property energia = 100
	var property mochila = null

	method equiparObjeto() {
	}

	method utilizarObjeto(unObjeto) {
		unObjeto.utilizarObjeto()
	}

	method interactuarConObjetos(variosObjetos) {
		if (variosObjetos != null) {
			const todosLosObjetos = variosObjetos.map({ unObjecto => unObjecto.interactuarConObjeto() })
			if (todosLosObjetos != null) {
				const objetosObtenidos = todosLosObjetos.filter({ unObjecto => unObjecto != null })
				objetosObtenidos.forEach({ unObjecto => self.agregarObjeto(unObjecto)})
			}
		}
	}

	method agregarObjeto(unObjeto) {
		if (unObjeto != null && unObjeto.categoria() == "mochila") {
			if(game.hasVisual(unObjeto)){
				game.removeVisual(unObjeto)
			}
			self.mochila(unObjeto)
			mochila.agregarObjeto(unObjeto)
		}
		
		if (mochila != null) {
			if (mochila != null && unObjeto != null) {
				if(game.hasVisual(unObjeto)){
					game.removeVisual(unObjeto)
				}
				mochila.agregarObjeto(unObjeto)
			}
		} else {
			game.say(self, "Necesitas una mochila para cargar objetos")
		}
	}

	method desecharObjeto(unObjeto) {
		if (mochila != null) {
			mochila.desecharObjeto(unObjeto)
		}
	}

	method cantidadLlaves() {
		return mochila.llaves()
	}

	override method image() {
		// if(self.tieneAlgoEnMano1()){
		// return "individuo/personaje + orientacion.nombre() + mano1.getObjeto() + ".png"
		// }
		// if(selftieneAlgoEnMano2()){
		// return "individuo/personaje + orientacion.nombre() + mano2.getObjeto() + ".png"
		// }
		// if(self.tieneAlgoEnAmbasManos()){
		// return "individuo/personaje + orientacion.nombre() + mano1.getObjeto() + mano2.getObjeto() + ".png"
		// }
		return "personaje/personaje" + orientacion.nombre() + ".png"
	}

}

object enemigo inherits Individuo (position = game.at(10, 10), imagen = "individuo/enemigo.png") {

	var property visible = false

}

