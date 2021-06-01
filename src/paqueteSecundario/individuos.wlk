import wollok.game.*
import direcciones.*
import paquetePrimario.menu.*
import paquetePrimario.imagen.*
import paqueteSecundario.objetos.*
import paqueteSecundario.pantallas.*
import paquetePrimario.audio.*

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
		if (direccion.puedeIr(individuo)) {
			self.moverHacia(individuo, direccion)
		}
	}

	method puedeMoverse(posicion) = posicion.allElements().all({ objeto => objeto.esAtravesable() })

	method moverHacia(individuo, direccion) {
		const nuevaPosicion = direccion.posicion(individuo.position())
		if (self.puedeMoverse(nuevaPosicion)) {
			individuo.orientacion(direccion)
			individuo.position(nuevaPosicion)
		}
	}

	method atacar()

	method recibirDanio(danio) {
		if (mano2 != null and mano2.categoria() == "escudo") {
			vida -= danio - mano2.defensa()
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

	method interactuarConObjetos() {
		const objetosDelante = orientacion.objetosFrentreAlIndividuo(self)
		const objetosBajo = orientacion.objetosEnLaPosicionDelIndividuo(self)
		const ambosObjetos = objetosDelante + objetosBajo
		if (ambosObjetos != null) {
			const todosLosObjetos = ambosObjetos.map({ unObjecto => unObjecto.interactuarConObjeto() })
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
			const enemigos = orientacion.enemigosFrenteAlIndividuo(self)
			if (!enemigos.isEmpty()) {
				enemigos.forEach{ unEnemigo => unEnemigo.recibirDanio(mano1.danio())}
			} else {
				game.schedule(1, { audio.reproducirSonido("ataque")})
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

	override method recibirDanio(danio) {
		super(danio)
		game.schedule(1, { audio.reproducirSonido("danioPersonaje")})
	}

}

class Enemigo inherits Individuo {

	var property ataque = 0

	override method atacar() {
		personaje.recibirDanio(ataque)
	}

	override method teEncontro() {
		self.atacar()
	}

	method moverse() {
		game.onTick(1000, "perseguir" + self, { self.moverHaciaJugador()})
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
		game.removeTickEvent("perseguir" + self)
		menu.removeVida(posicionCorazon1, posicionCorazon2, posicionCorazon3)
	}

	override method recibirDanio(danio) {
		super(danio)
		game.schedule(1, { audio.reproducirSonido("ataqueEnemigo")})
	}

}

object enemigos{
	method agregarEnemigoNivel1() {
		game.addVisual(enemigoConLLaveVerdeNivel1)
		enemigoConLLaveVerdeNivel1.moverse()
		game.addVisual(enemigoConLlaveRojaNivel1)
		enemigoConLlaveRojaNivel1.moverse()
		game.addVisual(enemigoConLlaveCofre1Nivel1)
		enemigoConLlaveCofre1Nivel1.moverse()
		game.addVisual(enemigoConLlaveCofre2Nivel1)
		enemigoConLlaveCofre2Nivel1.moverse()
		game.addVisual(enemigoConLlaveCofre3Nivel1)
		enemigoConLlaveCofre3Nivel1.moverse()
		game.addVisual(enemigoNadaNivel1)
		enemigoNadaNivel1.moverse()
	}
	
	method agregarEnemigoNivel2() {

	}

	method agregarEnemigoNivel3() {

	}
}

object enemigoConLLaveVerdeNivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(6, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveVerde, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveRojaNivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(13, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		game.addVisualIn(llaveRoja, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre1Nivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(10, 10), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre2Nivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(10, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}


object enemigoConLlaveCofre3Nivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(19, 12), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoNadaNivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(18, 8), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

}


