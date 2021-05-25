import wollok.game.*
import direcciones.*
import paquetePrimario.imagen.*
import paqueteSecundario.objetos.*

class Individuo inherits Imagen {

	var property orientacion = derecha
	var property vida = 6
	var property armadura = null
	var property mano1 = null
	var property mano2 = null

	method moverse(direccion) {
		self.moverHaciaSiSePuede(self, direccion)
	}

	method moverHaciaSiSePuede(individuo, direccion) {
		// console.println(direccion.puedeIr(individuo))
		if (direccion.puedeIr(individuo)) {
			self.moverHacia(individuo, direccion)
		} else {
		// console.println(direccion)
		}
	}

	method moverHacia(individuo, direccion) {
		const nuevaPosicion = direccion.posicion(individuo.position())
		if (self.puedeMoverse(nuevaPosicion)) {
			// console.println(individuo.toString())
			// console.println(nuevaPosicion)
			// console.println(individuo.position())
			// console.println(direccion)
			individuo.orientacion(direccion)
			individuo.position(nuevaPosicion)
		} else {
		// console.println(self.puedeMoverse(nuevaPosicion))
		// console.println(nuevaPosicion)
		}
	}

	method puedeMoverse(posicion) = posicion.allElements().all({ objeto => objeto.esAtravesable() })

	method atacar()

	method recibirDanio(danio) {
		vida -= danio
		self.mostrarVida()
		self.estaMuerto()
	}

	method estaMuerto() {
		if (self.vida() <= 0) {
			game.removeVisual(self)
			self.murio()
		}
	}

	method murio()

	method mostrarVida()
	
	method removeVida()

}

object personaje inherits Individuo (position = game.at(1, 1), imagen = "individuo/personaje.png") {

	var property energia = 100
	var property mochila = null
	var property ataque = false

	method equiparObjeto(unObjeto) {
		self.mano1(unObjeto)
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
			if (game.hasVisual(unObjeto)) {
				game.removeVisual(unObjeto)
			}
			self.mochila(unObjeto)
			mochila.agregarObjeto(unObjeto)
		}
		if (mochila != null) {
			if (mochila != null && unObjeto != null) {
				if (game.hasVisual(unObjeto)) {
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

	override method atacar() {
		if (self.mano1() != null) {
			self.ataque(true)
			const objects = game.getObjectsIn(game.at(orientacion.posicion(self.position()).x(), orientacion.posicion(self.position())).y())
			const enemigos = objects.filter{ unObjeto => unObjeto.categoria() == 'enemigo' }
			if (enemigos != null) {
				enemigos.forEach{ unEnemigo => unEnemigo.recibirDanio(mano1.danio())}
			}
			game.schedule(500, { self.ataque(false)})
		} else {
			game.say(self, "Necesitas una espada para atacar")
		}
	}

	override method image() {
		if (self.mano1() != null && self.ataque()) {
			return "personaje/personaje" + mano1 + "Ataque" + orientacion.nombre() + ".png"
		}
		if (self.mano1() != null) {
			return "personaje/personaje" + mano1 + orientacion.nombre() + ".png"
		}
			// if(selftieneAlgoEnMano2()){
			// return "individuo/personaje + mano2.getObjeto() + orientacion.nombre() ".png"
			// }
			// if(self.tieneAlgoEnAmbasManos()){
			// return "individuo/personaje + mano1.getObjeto() + mano2.getObjeto() + orientacion.nombre() + ".png"
			// }
		return "personaje/personaje" + orientacion.nombre() + ".png"
	}

	override method murio() {
		// Pantalla GAME OVER
	}

	override method mostrarVida() {
		self.removeVida()
		const corazon1X = 23
		const corazon2X = 24
		const corazon3X = 25
		const corazonY = 12
		if (vida == 6) {
			game.addVisualIn(corazonCompletoPersonaje1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonCompletoPersonaje2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonCompletoPersonaje3, game.at(corazon3X, corazonY))
		}
		if (vida == 5) {
			game.addVisualIn(corazonCompletoPersonaje1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonCompletoPersonaje2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonMitadPersonaje1, game.at(corazon3X, corazonY))
		}
		if (vida == 4) {
			game.addVisualIn(corazonCompletoPersonaje1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonCompletoPersonaje2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioPersonaje1, game.at(corazon3X, corazonY))
		}
		if (vida == 3) {
			game.addVisualIn(corazonCompletoPersonaje1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonMitadPersonaje1, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioPersonaje1, game.at(corazon3X, corazonY))
		}
		if (vida == 2) {
			game.addVisualIn(corazonCompletoPersonaje1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonVacioPersonaje1, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioPersonaje2, game.at(corazon3X, corazonY))
		}
		if (vida == 1) {
			game.addVisualIn(corazonMitadPersonaje1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonVacioPersonaje1, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioPersonaje2, game.at(corazon3X, corazonY))
		}
		if (vida == 0) {
			game.addVisualIn(corazonVacioPersonaje1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonVacioPersonaje2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioPersonaje3, game.at(corazon3X, corazonY))
		}
	}
	
	override method removeVida(){
		if (game.hasVisual(corazonCompletoPersonaje1)) {
			game.removeVisual(corazonCompletoPersonaje1)
		}
		if (game.hasVisual(corazonCompletoPersonaje2)) {
			game.removeVisual(corazonCompletoPersonaje2)
		}
		if (game.hasVisual(corazonCompletoPersonaje3)) {
			game.removeVisual(corazonCompletoPersonaje3)
		}
		if (game.hasVisual(corazonMitadPersonaje1)) {
			game.removeVisual(corazonMitadPersonaje1)
		}
		if (game.hasVisual(corazonMitadPersonaje2)) {
			game.removeVisual(corazonMitadPersonaje2)
		}
		if (game.hasVisual(corazonMitadPersonaje3)) {
			game.removeVisual(corazonMitadPersonaje3)
		}
		if (game.hasVisual(corazonVacioPersonaje1)) {
			game.removeVisual(corazonVacioPersonaje1)
		}
		if (game.hasVisual(corazonVacioPersonaje2)) {
			game.removeVisual(corazonVacioPersonaje2)
		}
		if (game.hasVisual(corazonVacioPersonaje3)) {
			game.removeVisual(corazonVacioPersonaje3)
		}
	}

}

class Enemigo inherits Individuo {

	var property ataque = 0

	override method atacar() {
		personaje.recibirDanio(ataque)
	}

	method agregarEnemigoNivel1() {
		game.addVisual(self)
		self.moverse()
	}

	method agregarEnemigoNivel2() {
		game.addVisualIn(self, game.at(3, 10))
		game.addVisualIn(self, game.at(9, 6))
		vida = 2
	}

	method agregarEnemigoNivel3() {
		game.addVisualIn(self, game.at(4, 11))
		game.addVisualIn(self, game.at(13, 4))
		game.addVisualIn(self, game.at(19, 7))
		vida = 4
	}

	override method teEncontro() {
		self.atacar()
	}

	method moverse() {
		game.onTick(1000, "Perseguir1", { self.moverHaciaJugador()})
	}

	method direccionMasConveniente(direcciones) = direcciones.min{ direccion => direccion.posicion(self.position()).distance(personaje.position()) }

	method moverHaciaJugador() {
		var direccionMasConveniente = self.direccionMasConveniente(self.direccionesAtravesables())
			// console.println(direccionMasConveniente.toString())
		self.moverHaciaSiSePuede(self, direccionMasConveniente)
	}

	method direccionesAtravesables() = [ izquierda, arriba, abajo, derecha ].filter{ direccion => direccion.puedeIr(self) }

	override method image() {
		return "enemigo/enemigoZombieChico" + orientacion.nombre() + ".png"
	}

	override method murio() {
		game.removeTickEvent("Perseguir1")
	}

	override method mostrarVida() {
		self.removeVida()
		const corazon1X = 23
		const corazon2X = 24
		const corazon3X = 25
		const corazonY = 12
		if (vida == 6) {
			game.addVisualIn(corazonCompletoEnemigo1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonCompletoEnemigo2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonCompletoEnemigo3, game.at(corazon3X, corazonY))
		}
		if (vida == 5) {
			game.addVisualIn(corazonCompletoEnemigo1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonCompletoEnemigo2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonMitadEnemigo1, game.at(corazon3X, corazonY))
		}
		if (vida == 4) {
			game.addVisualIn(corazonCompletoEnemigo1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonCompletoEnemigo2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioEnemigo1, game.at(corazon3X, corazonY))
		}
		if (vida == 3) {
			game.addVisualIn(corazonCompletoEnemigo1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonMitadEnemigo1, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioEnemigo1, game.at(corazon3X, corazonY))
		}
		if (vida == 2) {
			game.addVisualIn(corazonCompletoEnemigo1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonVacioEnemigo1, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioEnemigo2, game.at(corazon3X, corazonY))
		}
		if (vida == 1) {
			game.addVisualIn(corazonMitadEnemigo1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonVacioEnemigo1, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioEnemigo2, game.at(corazon3X, corazonY))
		}
		if (vida == 0) {
			game.addVisualIn(corazonVacioEnemigo1, game.at(corazon1X, corazonY))
			game.addVisualIn(corazonVacioEnemigo2, game.at(corazon2X, corazonY))
			game.addVisualIn(corazonVacioEnemigo3, game.at(corazon3X, corazonY))
			game.schedule(500, { self.removeVida() })
		}
	}
	
	override method removeVida(){
		if (game.hasVisual(corazonCompletoEnemigo1)) {
			game.removeVisual(corazonCompletoEnemigo1)
		}
		if (game.hasVisual(corazonCompletoEnemigo2)) {
			game.removeVisual(corazonCompletoEnemigo2)
		}
		if (game.hasVisual(corazonCompletoEnemigo3)) {
			game.removeVisual(corazonCompletoEnemigo3)
		}
		if (game.hasVisual(corazonMitadEnemigo1)) {
			game.removeVisual(corazonMitadEnemigo1)
		}
		if (game.hasVisual(corazonMitadEnemigo2)) {
			game.removeVisual(corazonMitadEnemigo2)
		}
		if (game.hasVisual(corazonMitadEnemigo3)) {
			game.removeVisual(corazonMitadEnemigo3)
		}
		if (game.hasVisual(corazonVacioEnemigo1)) {
			game.removeVisual(corazonVacioEnemigo1)
		}
		if (game.hasVisual(corazonVacioEnemigo2)) {
			game.removeVisual(corazonVacioEnemigo2)
		}
		if (game.hasVisual(corazonVacioEnemigo3)) {
			game.removeVisual(corazonVacioEnemigo3)
		}
	}

}

const enemigo = new Enemigo(vida = 2, ataque = 1, position = game.at(10, 10), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo')

