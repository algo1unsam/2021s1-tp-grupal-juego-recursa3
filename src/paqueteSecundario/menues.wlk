import wollok.game.*
import paquetePrimario.imagen.*

class Menu inherits Imagen {

}

object menues inherits Menu {

	method agregarMenu() {
		game.addVisual(new Menu(position = game.at(21, 0), imagen = "menues/menu.jpg"))
	}

}

