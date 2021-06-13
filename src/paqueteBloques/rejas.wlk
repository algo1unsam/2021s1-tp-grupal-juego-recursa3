import wollok.game.*
import sombras.*
import paquetePrimario.imagen.*
import paquetePrimario.audio.*
import paqueteSecundario.individuos.*

class Reja inherits Imagen {

	override method esAtravesable() = false

	override method interactuarConObjeto() {
		game.schedule(1, { audio.reproducirSonido("rejaAbierta")})
		game.removeVisual(self)
		return null
	}

}

object rejas {

	method agregarRejasNivel1() {
		game.addVisual(rejaAzulNivel1)
		game.addVisual(rejaVerdeNivel1)
		game.addVisual(rejaRojaNivel1)
	}

	method agregarRejasNivel2() {
		game.addVisual(rejaAzulNivel2)
		game.addVisual(rejaVerdeNivel2)
		game.addVisual(rejaRojaNivel2)
	}

	method agregarRejasNivel3() {
		game.addVisual(rejaAzulNivel3)
		game.addVisual(rejaVerdeNivel3)
		game.addVisual(rejaRojaNivel3)
	}

}

object rejaAzulNivel1 inherits Reja(position = game.at(5, 5), imagen = "rejas/azul.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila() != null && personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveAzul"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveAzul"})
			super()
			sombras.agregarSombra2Nivel1()
			enemigosNivel1.agregarEnemigosZonaAzul()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Azul")
			game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaVerdeNivel1 inherits Reja(position = game.at(7, 5), imagen = "rejas/verde.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila() != null && personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveVerde"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveVerde"})
			super()
			sombras.agregarSombra3Nivel1()
			enemigosNivel1.agregarEnemigosZonaVerde()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Verde")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaRojaNivel1 inherits Reja(position = game.at(15, 7), imagen = "rejas/roja.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveRoja"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveRoja"})
			super()
			sombras.removerSombra3Nivel1()
			enemigosNivel1.agregarEnemigosZonaRoja()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Roja")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaAzulNivel2 inherits Reja(position = game.at(17, 7), imagen = "rejas/azul.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveAzul"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveAzul"})
			super()
			sombras.agregarSombra2Nivel2()
			enemigosNivel2.agregarEnemigosZonaAzul()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Azul")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaVerdeNivel2 inherits Reja(position = game.at(1, 3), imagen = "rejas/verde.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveVerde"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveVerde"})
			super()
			sombras.agregarSombra3Nivel2()
			enemigosNivel2.agregarEnemigosZonaVerde()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Verde")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaRojaNivel2 inherits Reja(position = game.at(6, 9), imagen = "rejas/roja.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveRoja"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveRoja"})
			super()
			sombras.removerSombra3Nivel2()
			enemigosNivel2.agregarEnemigosZonaRoja()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Roja")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaAzulNivel3 inherits Reja(position = game.at(9, 3), imagen = "rejas/azul.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveAzul"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveAzul"})
			super()
			sombras.agregarSombra2Nivel3()
			enemigosNivel3.agregarEnemigosZonaAzul()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Azul")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaVerdeNivel3 inherits Reja(position = game.at(17, 11), imagen = "rejas/verde.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveVerde"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveVerde"})
			super()
			sombras.agregarSombra3Nivel3()
			enemigosNivel3.agregarEnemigosZonaVerde()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Verde")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

object rejaRojaNivel3 inherits Reja(position = game.at(1, 9), imagen = "rejas/roja.png") {

	override method interactuarConObjeto() {
		if (personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == "llaveRoja"})) {
			const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == "llaveRoja"})
			super()
			sombras.agregarSombra4Nivel3()
			personaje.utilizarObjeto(miLlave)
		} else {
			game.say(personaje, "Necesitas encontrar la llave Roja")
		 	game.schedule(1, { audio.reproducirSonido("rejaCerrada")})
		}
		return null
	}

}

