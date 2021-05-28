import wollok.game.*
import paquetePrimario.imagen.*

class Borde inherits Imagen {

	override method esAtravesable() = false

	method agregarBordesCompleto() {
		game.addVisual(new Borde(position = game.at(0, 0), imagen = "Bordes/bordeDerechoInferior.png"))
		game.addVisual(new Borde(position = game.at(1, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(2, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(3, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(4, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(5, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(6, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(7, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(8, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(9, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(10, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(11, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(12, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(13, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(14, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(15, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(16, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(17, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(18, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(19, 0), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(20, 0), imagen = "Bordes/bordeIzquierdoInferior.png"))
		game.addVisual(new Borde(position = game.at(20, 1), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 2), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 3), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 4), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 5), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 6), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 7), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 8), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 9), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 10), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 11), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 12), imagen = "Bordes/bordeIzquierdo.png"))
		game.addVisual(new Borde(position = game.at(20, 13), imagen = "Bordes/bordeIzquiedoSuperior.png"))
		game.addVisual(new Borde(position = game.at(1, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(2, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(3, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(4, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(5, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(6, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(7, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(8, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(9, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(10, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(11, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(12, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(13, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(14, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(15, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(16, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(17, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(18, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(19, 13), imagen = "Bordes/bordeCompleto.png"))
		game.addVisual(new Borde(position = game.at(0, 1), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 2), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 3), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 4), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 5), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 6), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 7), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 8), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 9), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 10), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 11), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 12), imagen = "Bordes/bordeDerecho.png"))
		game.addVisual(new Borde(position = game.at(0, 13), imagen = "Bordes/bordeDerechoSuperior.png"))
	}

}

object bordes inherits Borde {

	method agregarBordesNivel1() {
		self.agregarBordesCompleto()
		game.addVisual(new Borde(position = game.at(8, 1), imagen = "Bordes/bordeIzquierdConTecho.png"))
		game.addVisual(new Borde(position = game.at(9, 1), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(10, 1), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(11, 1), imagen = "Bordes/bordeSinParteDeAbajo.png"))
		game.addVisual(new Borde(position = game.at(12, 1), imagen = "Bordes/bordeDerechoConBordeIzquierdoSuperior.png"))
		game.addVisual(new Borde(position = game.at(8, 0), imagen = "Bordes/bordeIzquierdoInferior.png"))
		game.addVisual(new Borde(position = game.at(9, 0), imagen = "General/todoNegro.png"))
		game.addVisual(new Borde(position = game.at(10, 0), imagen = "General/todoNegro.png"))
		game.addVisual(new Borde(position = game.at(11, 0), imagen = "General/todoNegro.png"))
		game.addVisual(new Borde(position = game.at(12, 0), imagen = "Bordes/bordeDerechoInferior.png"))
	}

	method agregarBordesNivel2() {
		self.agregarBordesCompleto()
		game.addVisual(new Borde(position = game.at(5, 13), imagen = "Paredes/paredUnionSuperiorHV.png"))
		game.addVisual(new Borde(position = game.at(16, 13), imagen = "Paredes/paredUnionSuperiorHV.png"))
		game.addVisual(new Borde(position = game.at(18, 13), imagen = "Paredes/paredUnionSuperiorHV.png"))
		game.addVisual(new Borde(position = game.at(9, 0), imagen = "Paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Borde(position = game.at(16, 0), imagen = "Paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Borde(position = game.at(18, 0), imagen = "Paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Borde(position = game.at(20, 11), imagen = "Paredes/paredUnionIzquierdoHV.png"))
		game.addVisual(new Borde(position = game.at(20, 6), imagen = "Paredes/paredUnionIzquierdoHV.png"))
		game.addVisual(new Borde(position = game.at(0, 6), imagen = "Paredes/paredUnionDerechoHV.png"))

	}
		method agregarBordesNivel3() {
		self.agregarBordesCompleto()
		game.addVisual(new Borde(position = game.at(2, 13), imagen = "Paredes/paredUnionSuperiorHV.png"))
		game.addVisual(new Borde(position = game.at(12, 13), imagen = "Paredes/paredUnionSuperiorHV.png"))
		game.addVisual(new Borde(position = game.at(7, 13), imagen = "Paredes/paredUnionSuperiorHV.png"))
		game.addVisual(new Borde(position = game.at(2, 0), imagen = "Paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Borde(position = game.at(10, 0), imagen = "Paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Borde(position = game.at(12, 0), imagen = "Paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Borde(position = game.at(15, 0), imagen = "Paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Borde(position = game.at(20, 11), imagen = "Paredes/paredUnionIzquierdoHV.png"))

	}

}

