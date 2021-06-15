import wollok.game.*
import direcciones.*
import paquetePrimario.menu.*
import paquetePrimario.audio.*
import paquetePrimario.imagen.*
import paqueteSecundario.objetos.*
import paqueteSecundario.pantallas.*
import paqueteBloques.salidas.*

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
		if (mano2 != null and mano2.categoria() == "escudo" and mano2.seDestruye(danio)) {
			vida -= danio - mano2.defensa()
			mano2 = null
		} else if (mano2 != null and !mano2.seDestruye(danio)) {
			mano2.defensa(mano2.defensa() - danio)
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
	var property defensa = 0

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
		if (unObjeto != null && unObjeto.categoria() == "mochila" && mochila == null) {
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

	method recibirVida(unaVida) {
		vida = (vida + unaVida).min(12)
		self.mostrarVida()
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
		game.schedule(10, { audio.reproducirSonido("muerteEnemigo")})
		game.schedule(100, { menu.removeVida(posicionCorazon1, posicionCorazon2, posicionCorazon3)})
	}

	override method recibirDanio(danio) {
		super(danio)
		game.schedule(1, { audio.reproducirSonido("ataqueEnemigo")})
	}

}

class EnemigoOrco inherits Enemigo{
	
	override method image() {
		return "enemigo/enemigoOrco" + orientacion.nombre() + ".png"
	}
}

class EnemigosNivel {

	method agregarEnemigosZonaInicio() {
		self.reiniciarPosicion()
		self.reinciarVida()
	}

	method agregarEnemigosZonaAzul()

	method agregarEnemigosZonaVerde()

	method agregarEnemigosZonaRoja()

	method reiniciarPosicion()
	
	method reinciarVida()

}

object enemigosNivel1 inherits EnemigosNivel {

	override method agregarEnemigosZonaInicio() {
		super()
		game.addVisual(enemigoConLLaveVerdeNivel1)
		enemigoConLLaveVerdeNivel1.moverse()
	}

	override method agregarEnemigosZonaAzul() {
	}

	override method agregarEnemigosZonaVerde() {
		game.addVisual(enemigoConLlaveRojaNivel1)
		enemigoConLlaveRojaNivel1.moverse()
		game.addVisual(enemigoConLlaveCofre1Nivel1)
		enemigoConLlaveCofre1Nivel1.moverse()
		game.addVisual(enemigoConLlaveCofre2Nivel1)
		enemigoConLlaveCofre2Nivel1.moverse()
	}

	override method agregarEnemigosZonaRoja() {
		game.addVisual(enemigoConLlaveCofre3Nivel1)
		enemigoConLlaveCofre3Nivel1.moverse()
		game.addVisual(enemigoNadaNivel1)
		enemigoNadaNivel1.moverse()
	}

	override method reiniciarPosicion() {
		enemigoConLLaveVerdeNivel1.position(game.at(7, 4))
		enemigoConLlaveRojaNivel1.position(game.at(13, 4))
		enemigoConLlaveCofre1Nivel1.position(game.at(10, 10))
		enemigoConLlaveCofre2Nivel1.position(game.at(10, 4))
		enemigoConLlaveCofre3Nivel1.position(game.at(19, 12))
		enemigoNadaNivel1.position(game.at(16, 6))
	}
	
	override method reinciarVida(){
		enemigoConLLaveVerdeNivel1.vida(2)
		enemigoConLlaveRojaNivel1.vida(2)
		enemigoConLlaveCofre1Nivel1.vida(2)
		enemigoConLlaveCofre2Nivel1.vida(2)
		enemigoConLlaveCofre3Nivel1.vida(2)
		enemigoNadaNivel1.vida(2)
		
	}

}

object enemigosNivel2 inherits EnemigosNivel {

	override method agregarEnemigosZonaInicio() {
		super()
		game.addVisual(enemigoConLlaveAzulNivel2)
		enemigoConLlaveAzulNivel2.moverse()
		game.addVisual(enemigoConLlaveCofre1Nivel2)
		enemigoConLlaveCofre1Nivel2.moverse()
	}

	override method agregarEnemigosZonaAzul() {
		game.addVisual(enemigoConLlaveVerdeNivel2)
		enemigoConLlaveVerdeNivel2.moverse()
	}

	override method agregarEnemigosZonaVerde() {
		game.addVisual(enemigoConLlaveCofre2Nivel2)
		enemigoConLlaveCofre2Nivel2.moverse()
		game.addVisual(enemigoConLlaveCofre4Nivel2)
		enemigoConLlaveCofre4Nivel2.moverse()
		game.addVisual(enemigoConLlaveRojaNivel2)
		enemigoConLlaveRojaNivel2.moverse()
	}

	override method agregarEnemigosZonaRoja() {
		game.addVisual(enemigoConLlaveCofre3Nivel2)
		enemigoConLlaveCofre3Nivel2.moverse()
	}

	override method reiniciarPosicion() {
		enemigoConLlaveAzulNivel2.position(game.at(11, 3))
		enemigoConLlaveVerdeNivel2.position(game.at(8, 10))
		enemigoConLlaveRojaNivel2.position(game.at(3, 11))
		enemigoConLlaveCofre1Nivel2.position(game.at(10, 7))
		enemigoConLlaveCofre2Nivel2.position(game.at(1, 9))
		enemigoConLlaveCofre3Nivel2.position(game.at(6, 12))
	}
	
	override method reinciarVida(){
		enemigoConLlaveAzulNivel2.vida(2)
		enemigoConLlaveVerdeNivel2.vida(4)
		enemigoConLlaveRojaNivel2.vida(4)
		enemigoConLlaveCofre1Nivel2.vida(4)
		enemigoConLlaveCofre2Nivel2.vida(2)
		enemigoConLlaveCofre3Nivel2.vida(4)
		enemigoConLlaveCofre4Nivel2.vida(2)
		
		
	}

}

object enemigosNivel3 inherits EnemigosNivel {

	override method agregarEnemigosZonaInicio() {
		super()
		game.addVisual(enemigoConLlaveAzulNivel3)
		enemigoConLlaveAzulNivel3.moverse()
		game.addVisual(enemigoConLlaveCofre3Nivel3)
		enemigoConLlaveCofre3Nivel3.moverse()
	}

	override method agregarEnemigosZonaAzul() {
		game.addVisual(enemigoConLlaveCofre1Nivel3)
		enemigoConLlaveCofre1Nivel3.moverse()
		game.addVisual(enemigoConLlaveCofre2Nivel3)
		enemigoConLlaveCofre2Nivel3.moverse()
		game.addVisual(enemigoConLlaveVerdeNivel3)
		enemigoConLlaveVerdeNivel3.moverse()
	}

	override method agregarEnemigosZonaVerde() {
		game.addVisual(enemigoConLlaveCofre4Nivel3)
		enemigoConLlaveCofre4Nivel3.moverse()
		game.addVisual(enemigoConLlaveCofre5Nivel3)
		enemigoConLlaveCofre5Nivel3.moverse()
		game.addVisual(enemigoConLlaveRojaNivel3)
		enemigoConLlaveRojaNivel3.moverse()
	}

	override method agregarEnemigosZonaRoja() {
		game.addVisual(enemigoFinalNivel3)
		enemigoFinalNivel3.moverse()
	}

	override method reiniciarPosicion() {
		enemigoConLlaveAzulNivel3.position(game.at(19, 1))
		enemigoConLlaveVerdeNivel3.position(game.at(1, 8))
		enemigoConLlaveRojaNivel3.position(game.at(6, 12))
		enemigoConLlaveCofre1Nivel3.position(game.at(4, 5))
		enemigoConLlaveCofre2Nivel3.position(game.at(4, 2))
		enemigoConLlaveCofre3Nivel3.position(game.at(15, 4))
		enemigoConLlaveCofre4Nivel3.position(game.at(13, 7))
		enemigoConLlaveCofre5Nivel3.position(game.at(14, 12))
		enemigoFinalNivel3.position(game.at(9, 12))
	}

	override method reinciarVida(){
		enemigoConLlaveAzulNivel3.vida(4)
		enemigoConLlaveVerdeNivel3.vida(4)
		enemigoConLlaveRojaNivel3.vida(4)
		enemigoConLlaveCofre1Nivel3.vida(4)
		enemigoConLlaveCofre2Nivel3.vida(4)
		enemigoConLlaveCofre3Nivel3.vida(2)
		enemigoConLlaveCofre4Nivel3.vida(2)
		enemigoConLlaveCofre5Nivel3.vida(4)
		enemigoFinalNivel3.vida(12)
		
		
	}

}

//Nivel 1
object enemigoConLLaveVerdeNivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(7, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveVerde, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveRojaNivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(13, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveRoja, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre1Nivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(10, 10), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre2Nivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(10, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre3Nivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(19, 12), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoNadaNivel1 inherits Enemigo(vida = 2, ataque = 1, position = game.at(16, 6), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

}

//Nivel 2
object enemigoConLlaveAzulNivel2 inherits Enemigo(vida = 2, ataque = 1, position = game.at(11, 3), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveAzul, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveVerdeNivel2 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(8, 10), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveVerde, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveRojaNivel2 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(3, 11), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveRoja, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre1Nivel2 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(10, 7), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre2Nivel2 inherits Enemigo(vida = 2, ataque = 1, position = game.at(1, 9), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre3Nivel2 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(6, 12), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre4Nivel2 inherits Enemigo(vida = 2, ataque = 1, position = game.at(1, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

//Nivel 3
object enemigoConLlaveAzulNivel3 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(19, 1), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveAzul, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveVerdeNivel3 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(1, 8), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveVerde, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveRojaNivel3 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(6, 12), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(llaveRoja, game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre1Nivel3 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(4, 5), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre2Nivel3 inherits EnemigoOrco(vida = 4, ataque = 2, position = game.at(4, 2), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre3Nivel3 inherits Enemigo(vida = 2, ataque = 1, position = game.at(15, 4), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre4Nivel3 inherits Enemigo(vida = 2, ataque = 1, position = game.at(13, 7), orientacion = abajo, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoConLlaveCofre5Nivel3 inherits Enemigo(vida = 4, ataque = 2, position = game.at(14, 12), orientacion = abajo, imagen = "enemigo/enemigoOrcoDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {

	override method murio() {
		super()
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(self.position().x(), self.position().y()))
	}

}

object enemigoFinalNivel3 inherits Enemigo(vida = 12, ataque = 2, position = game.at(9, 12), orientacion = abajo, imagen = "enemigo/enemigoFinalDerecha.png", categoria = 'enemigo', posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3()) {
	var property estaMuertoEnemigoFinal = false
	
	override method estaMuerto() {
		if (self.vida() <= 0 and !estaMuertoEnemigoFinal) {
			estaMuertoEnemigoFinal = true
			game.schedule(2500, { super() })
			audio.parar()
			audio.reproducirSonido("muerteEnemigoFinal")
			game.removeTickEvent("perseguir" + self)

		}
	}

	override method murio() {
		game.schedule(1, { menu.removeVida(posicionCorazon1, posicionCorazon2, posicionCorazon3)})
		game.schedule(50, { salidas.agregarSalidasNivel3Final()
			audio.reproducirCancionEnLoop("ambienteGanaste")
		})
	}

	override method image() {
		return "enemigo/enemigoFinal" + orientacion.nombre() + ".png"
	}

}

