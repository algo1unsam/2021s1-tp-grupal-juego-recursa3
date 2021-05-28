import wollok.game.*
import paquetePrimario.imagen.*
import paqueteSecundario.objetos.*

class Menu inherits Imagen {

	const property posicionMenu = game.at(21, 0)
	const property posicionCorazonPersonaje1 = game.at(23, 11)
	const property posicionCorazonPersonaje2 = game.at(24, 11)
	const property posicionCorazonPersonaje3 = game.at(25, 11)
	const property posicionArmaduraPersonaje = game.at(25, 10)
	const property posicionCorazonEnemigo1 = game.at(23, 8)
	const property posicionCorazonEnemigo2 = game.at(24, 8)
	const property posicionCorazonEnemigo3 = game.at(25, 8)
	const property posicionMochilaChica = game.at(22, 5)
	const property posicionMochilaGrande = game.at(23, 5)
	const property posicionLlaveCofre = game.at(25, 5)
	const property posicionLlaveAzul = game.at(22, 4)
	const property posicionLlaveRoja = game.at(23, 4)
	const property posicionLlaveVerde = game.at(24, 4)
	const property posicionEspadaChica = game.at(22, 3)
	const property posicionEspadaGrande = game.at(23, 3)
	const property posicionEscudoChico = game.at(22, 2)
	const property posicionEscudoGrande = game.at(23, 2)

	method mostrarVida(posicionCorazon1, posicionCorazon2, posicionCorazon3, vida) {
		self.removeVida(posicionCorazon1, posicionCorazon2, posicionCorazon3)
		if (vida == 6) {
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon1)
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon2)
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon3)
		}
		if (vida == 5) {
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon1)
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon2)
			game.addVisualIn(new CorazonMitad(categoria = "corazon", peso = 0, imagen = "corazones/corazonMitad.png"), posicionCorazon3)
		}
		if (vida == 4) {
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon1)
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon2)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon3)
		}
		if (vida == 3) {
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon1)
			game.addVisualIn(new CorazonMitad(categoria = "corazon", peso = 0, imagen = "corazones/corazonMitad.png"), posicionCorazon2)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon3)
		}
		if (vida == 2) {
			game.addVisualIn(new CorazonCompleto(categoria = "corazon", peso = 0, imagen = "corazones/corazonCompleto.png"), posicionCorazon1)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon2)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon3)
		}
		if (vida == 1) {
			game.addVisualIn(new CorazonMitad(categoria = "corazon", peso = 0, imagen = "corazones/corazonMitad.png"), posicionCorazon1)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon2)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon3)
		}
		if (vida == 0) {
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon1)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon2)
			game.addVisualIn(new CorazonVacio(categoria = "corazon", peso = 0, imagen = "corazones/corazonVacio.png"), posicionCorazon3)
		}
	}

	method removeVida(posicionCorazon1, posicionCorazon2, posicionCorazon3) {
		game.getObjectsIn(posicionCorazon1).forEach({ visual => game.removeVisual(visual)})
		game.getObjectsIn(posicionCorazon2).forEach({ visual => game.removeVisual(visual)})
		game.getObjectsIn(posicionCorazon3).forEach({ visual => game.removeVisual(visual)})
	}

}

object menu inherits Menu {

	method agregarMenu() {
		game.addVisual(new Menu(position = self.posicionMenu(), imagen = "menu/menu.jpg"))
	}

}

