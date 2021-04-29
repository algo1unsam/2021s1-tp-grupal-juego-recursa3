import wollok.game.*

class Pared {
	var property position = game.at(0,0)
	var property imagen = "paredes/vacio.png"
	method esAtravesable() = false
	
	method image() = imagen 
}

object paredes{
	
	method agregarParedesNivel1() {
		game.addVisual(new Pared(position = game.at(6,7), imagen = "paredes/paredBordeIzquierdoH.png"))
		game.addVisual(new Pared(position = game.at(7,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(8,7),  imagen = "paredes/paredUnionHVConTecho.png"))
		game.addVisual(new Pared(position = game.at(9,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(10,7),  imagen = "paredes/paredBordeDerechoH.png"))
		
		game.addVisual(new Pared(position = game.at(6,9),  imagen = "paredes/paredBordeIzquierdoH.png"))
		game.addVisual(new Pared(position = game.at(7,9),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(8,9),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(9,9),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(10,9),  imagen = "paredes/paredBordeDerechoH.png"))
		
		game.addVisual(new Pared(position = game.at(12,8),  imagen = "paredes/paredCompleta.png"))
		
		game.addVisual(new Pared(position = game.at(8,3),  imagen = "paredes/paredInferiorV.png"))
		game.addVisual(new Pared(position = game.at(8,4),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(8,5),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(8,6),  imagen = "paredes/paredV.png"))
	}
}