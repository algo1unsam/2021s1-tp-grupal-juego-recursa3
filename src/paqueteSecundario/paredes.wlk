import wollok.game.*
import paquetePrimario.imagen.*

class Pared inherits Imagen{
	override method esAtravesable() = false
}

object paredes{
	
	method agregarParedesNivel1() {
		
		// Verticales
		game.addVisual(new Pared(position = game.at(2,0),  imagen = "paredes/paredUnionInferiorHV.png"))
		game.addVisual(new Pared(position = game.at(2,1),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(2,2),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(2,3),  imagen = "paredes/paredSuperiorV.png"))

		game.addVisual(new Pared(position = game.at(2,11),  imagen = "paredes/paredInferiorV.png"))
		game.addVisual(new Pared(position = game.at(2,12),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(2,13),  imagen = "paredes/paredUnionSuperiorHV.png"))
		
		game.addVisual(new Pared(position = game.at(4,2),  imagen = "paredes/paredInferiorV.png"))
		game.addVisual(new Pared(position = game.at(4,3),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(4,4),  imagen = "paredes/paredV.png"))

		game.addVisual(new Pared(position = game.at(4,9),  imagen = "paredes/paredBordeDerechoUnionHV.png"))
		game.addVisual(new Pared(position = game.at(4,10),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(4,11),  imagen = "paredes/paredSuperiorV.png"))

		game.addVisual(new Pared(position = game.at(6,2),  imagen = "paredes/paredInferiorV.png"))
		game.addVisual(new Pared(position = game.at(6,3),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,4),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,5),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,6),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,7),  imagen = "paredes/paredUnionHV.png"))
		game.addVisual(new Pared(position = game.at(6,8),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,9),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,10),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,11),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,12),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(6,13),  imagen = "paredes/paredUnionSuperiorHV.png"))
		
		game.addVisual(new Pared(position = game.at(8,3),  imagen = "paredes/paredBordeIzquierdoUnionHV.png"))
		game.addVisual(new Pared(position = game.at(8,4),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(8,5),  imagen = "paredes/paredIzquierdoUnionHV.png"))
		
		game.addVisual(new Pared(position = game.at(8,9),  imagen = "paredes/paredBordeIzquierdoUnionHV.png"))
		game.addVisual(new Pared(position = game.at(8,10),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(8,11),  imagen = "paredes/paredSuperiorV.png"))

		game.addVisual(new Pared(position = game.at(12,2),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(12,3),  imagen = "paredes/paredDerechoUnionHV.png"))

		game.addVisual(new Pared(position = game.at(12,5),  imagen = "paredes/paredBordeDerechoUnionHV.png"))
		game.addVisual(new Pared(position = game.at(12,6),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(12,7),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(12,8),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(12,9),  imagen = "paredes/paredDerechoUnionHV.png"))

		game.addVisual(new Pared(position = game.at(14,10),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(14,9),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(14,8),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(14,7),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(14,6),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(14,5),  imagen = "paredes/paredBordeIzquierdoUnionHV.png"))
		
		game.addVisual(new Pared(position = game.at(14,3),  imagen = "paredes/paredSuperiorV.png"))
		game.addVisual(new Pared(position = game.at(14,2),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(14,1),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(14,0),  imagen = "paredes/paredUnionInferiorHV.png"))

		game.addVisual(new Pared(position = game.at(16,13),  imagen = "paredes/paredUnionSuperiorHV.png"))
		game.addVisual(new Pared(position = game.at(16,12),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(16,11),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(16,10),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(16,9),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(16,8),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(16,7),  imagen = "paredes/paredInferiorV.png"))

		game.addVisual(new Pared(position = game.at(16,3),  imagen = "paredes/paredSuperiorV.png"))
		game.addVisual(new Pared(position = game.at(16,2),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(16,1),  imagen = "paredes/paredV.png"))
		game.addVisual(new Pared(position = game.at(16,0),  imagen = "paredes/paredUnionInferiorHV.png"))		


		// Horizontales
		game.addVisual(new Pared(position = game.at(0,5),  imagen = "paredes/paredUnionDerechoHV.png"))
		game.addVisual(new Pared(position = game.at(1,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(2,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(3,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(4,5),  imagen = "paredes/paredDerechoUnionHV.png"))

		game.addVisual(new Pared(position = game.at(2,7),  imagen = "paredes/paredBordeIzquierdoH.png"))
		game.addVisual(new Pared(position = game.at(3,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(4,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(5,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(7,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(8,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(9,7),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(10,7),  imagen = "paredes/paredBordeDerechoH.png"))

		game.addVisual(new Pared(position = game.at(0,9),  imagen = "paredes/paredUnionDerechoHV.png"))
		game.addVisual(new Pared(position = game.at(1,9),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(2,9),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(3,9),  imagen = "paredes/paredSinBordesH.png"))
		
		game.addVisual(new Pared(position = game.at(9,3),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(10,3),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(11,3),  imagen = "paredes/paredSinBordesH.png"))
	
		game.addVisual(new Pared(position = game.at(9,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(10,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(11,5),  imagen = "paredes/paredSinBordesH.png"))

		game.addVisual(new Pared(position = game.at(9,9),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(10,9),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(11,9),  imagen = "paredes/paredSinBordesH.png"))		
		
		game.addVisual(new Pared(position = game.at(10,11),  imagen = "paredes/paredBordeIzquierdoH.png"))
		game.addVisual(new Pared(position = game.at(11,11),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(12,11),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(13,11),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(14,11),  imagen = "paredes/paredDerechoUnionHV.png"))

		game.addVisual(new Pared(position = game.at(15,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(16,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(17,5),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(18,5),  imagen = "paredes/paredDerechoUnionHV.png"))
		
		game.addVisual(new Pared(position = game.at(18,4),  imagen = "paredes/paredBordeIzquierdoUnionHV.png"))
		game.addVisual(new Pared(position = game.at(19,4),  imagen = "paredes/paredBordeDerechoH.png"))
	
		game.addVisual(new Pared(position = game.at(18,2),  imagen = "paredes/paredBordeIzquierdoH.png"))
		game.addVisual(new Pared(position = game.at(19,2),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(20,2),  imagen = "paredes/paredSinBordesH.png"))
		game.addVisual(new Pared(position = game.at(21,2),  imagen = "paredes/paredUnionIzquierdoHV.png"))
	}
}