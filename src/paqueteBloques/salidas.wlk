import wollok.game.*
import paquetePrimario.imagen.*
import paquetePrimario.audio.*
import paqueteSecundario.pantallas.*

class Salida inherits Imagen {

	override method teEncontro() {
		game.schedule(5, { game.addVisualIn(pantallaJuego.pantallaNivel(), game.origin()) })
		game.schedule(10, { audio.reproducirSonido("salida")
			pantallaJuego.nivelActual().finalizarNivel()
		})
	}

}

object salidas {

	method agregarSalidasNivel1() {
		// Elimina todo objeto que este en el lugar donde voy a poner la salida.
		game.getObjectsIn(game.at(19, 13)).forEach({ visual => game.removeVisual(visual)})
			// Agrego la salida
		game.addVisual(new Salida(position = game.at(19, 13), imagen = "puerta/puerta.png"))
	}

	method agregarSalidasNivel2() {
		// Elimina todo objeto que este en el lugar donde voy a poner la salida.
		game.getObjectsIn(game.at(11, 13)).forEach({ visual => game.removeVisual(visual)})
			// Agrego la salida
		game.addVisual(new Salida(position = game.at(11, 13), imagen = "puerta/puerta.png"))
	}

	method agregarSalidasNivel3() {
		// Elimina todo objeto que este en el lugar donde voy a poner la salida.
		game.getObjectsIn(game.at(1, 13)).forEach({ visual => game.removeVisual(visual)})
			// Agrego la salida
		game.addVisual(salidaPelea)
	}

	method agregarSalidasNivel3Final() {
		// Elimina todo objeto que este en el lugar donde voy a poner la salida.
		game.getObjectsIn(game.at(9, 13)).forEach({ visual => game.removeVisual(visual)})
			// Agrego la salida
		game.addVisual(salidaFinal)
		game.schedule(1, { audio.reproducirSonido("salida")})
	}

}

object salidaPelea inherits Salida(position = game.at(1, 13), imagen = "puerta/puerta.png") {

	override method teEncontro() {
		pantallaJuego.peleaFinal()
	}

}

object salidaFinal inherits Salida(position = game.at(9, 13), imagen = "puerta/puerta.png") {

	override method teEncontro() {
		pantallaJuego.nivelActual().finalizarNivel()
	}

}

