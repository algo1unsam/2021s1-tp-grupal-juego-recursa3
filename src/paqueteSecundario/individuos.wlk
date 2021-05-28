import wollok.game.*
import direcciones.*
import paquetePrimario.menu.*
import paquetePrimario.imagen.*
import paqueteSecundario.objetos.*
import paqueteSecundario.pantallas.*

class Individuo inherits Imagen {

	var property orientacion = derecha
	var property vida = 6
	var property armadura = null
	var property mano1 = null
	var property mano2 = null
	var property posicionCorazon1 = null
	var property posicionCorazon2 = null
	var property posicionCorazon3 = null

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

	method puedeMoverse(posicion) = posicion.allElements().all({ objeto => objeto.esAtravesable() })

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

	method atacar()

	method recibirDanio(danio) {
		if (mano2 != null and mano2.categoria() == "escudo") {
			vida -= danio - mano2.defensa()
//			if(mano2.defensa() == 0) {
//				game.removeVisual(mano2)
//				mano2 = null
//			}
		} else {
			vida -= danio
		}
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

	method mostrarVida() {
		menu.mostrarVida(posicionCorazon1, posicionCorazon2, posicionCorazon3, vida)
	}

}

object personaje inherits Individuo (position = game.at(1, 1), imagen = "individuo/personaje.png", posicionCorazon1 = menu.posicionCorazonPersonaje1(), posicionCorazon2 = menu.posicionCorazonPersonaje2(), posicionCorazon3 = menu.posicionCorazonPersonaje3()) {

	var property energia = 100
	var property mochila = null
	var property ataque = false

	method equiparObjetoMano1(unObjeto) {
		self.mano1(unObjeto)
	}

	method equiparObjetoMano2(unObjeto) {
		self.mano2(unObjeto)
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
		if (self.mano1() != null && self.mano2() == null && self.ataque()) {
			return "personaje/personaje" + mano1 + "Ataque" + orientacion.nombre() + ".png"
		}
		if (self.mano1() != null && self.mano2() != null && self.ataque()) {
			return "personaje/personaje" + mano1 + mano2 + "Ataque" + orientacion.nombre() + ".png"
		}
		if (self.mano1() != null && self.mano2() == null) {
			return "personaje/personaje" + mano1 + orientacion.nombre() + ".png"
		}
		if (self.mano1() != null && self.mano2() != null) {
			return "personaje/personaje" + mano1 + mano2 + orientacion.nombre() + ".png"
		}
		return "personaje/personaje" + orientacion.nombre() + ".png"
	}

	override method murio() {
		pantallaGameOver.iniciar()
	}

}

class Enemigo inherits Individuo{

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
	
	method removeVida(){
		
	}
}

object enemigo inherits Enemigo(vida = 2, ataque = 1, position = game.at(10, 10), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()){
	
}

