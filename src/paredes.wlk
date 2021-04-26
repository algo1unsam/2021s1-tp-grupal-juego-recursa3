import wollok.game.*

// Pared
class Pared {
	var property position
	method esAtravesable() = false
	
	method image() = "paredes/vacio.png"
}

object paredHorizontal inherits Pared(position = game.at(6,7)){
	override method image() = "paredes/paredBordeIzquierdo.png"
	
	method agregarParedesHorizontales() {
		game.addVisual(self)
		game.addVisual(paredHorizontal2)
		game.addVisual(paredHorizontal3)
		game.addVisual(paredHorizontal4)
		game.addVisual(paredHorizontal5)
		
		game.addVisual(paredHorizontal6)
		game.addVisual(paredHorizontal7)
		game.addVisual(paredHorizontal8)
		game.addVisual(paredHorizontal9)
		game.addVisual(paredHorizontal10)
		
		game.addVisual(paredHorizontal11)
	}
}

object paredHorizontal2 inherits Pared(position = game.at(7,7)){
	override method image() = "paredes/paredSinBordesHorizontales.png"
}

object paredHorizontal3 inherits Pared(position = game.at(8,7)){
	override method image() = "paredes/ParedHorizontalUnionVertical.png"
}

object paredHorizontal4 inherits Pared(position = game.at(9,7)){
	override method image() = "paredes/paredSinBordesHorizontales.png"
}

object paredHorizontal5 inherits Pared(position = game.at(10,7)){
	override method image() = "paredes/paredBordeDerecho.png"
}

object paredHorizontal6 inherits Pared(position = game.at(6,10)){
	override method image() = "paredes/paredBordeIzquierdo.png"
}

object paredHorizontal7 inherits Pared(position = game.at(7,10)){
	override method image() = "paredes/paredSinBordesHorizontales.png"
}

object paredHorizontal8 inherits Pared(position = game.at(8,10)){
	override method image() = "paredes/paredSinBordesHorizontales.png"
}

object paredHorizontal9 inherits Pared(position = game.at(9,10)){
	override method image() = "paredes/paredSinBordesHorizontales.png"
}

object paredHorizontal10 inherits Pared(position = game.at(10,10)){
	override method image() = "paredes/paredBordeDerecho.png"
}

object paredHorizontal11 inherits Pared(position = game.at(13,8)){
	override method image() = "paredes/paredCompleta.png"
}

object paredVertical inherits Pared(position = game.at(8,4)){
	override method image() = "paredes/paredVertical.png"
	
	method agregarParedesVerticales() {
		game.addVisual(self)
		game.addVisual(paredVertical2)
		game.addVisual(paredVertical3)
		game.addVisual(paredVertical4)
	}
}

object paredVertical2 inherits Pared(position = game.at(8,5)){
	override method image() = "paredes/paredVertical.png"
}

object paredVertical3 inherits Pared(position = game.at(8,6)){
	override method image() = "paredes/paredVertical.png"
}

object paredVertical4 inherits Pared(position = game.at(8,3)){
	override method image() = "paredes/paredVerticalInferior.png"
}