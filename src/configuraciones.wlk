import wollok.game.*
import direcciones.*
import individuo.*

// esto vamos a ver si anda

object configuraciones {

	const property altura = 14
	const property ancho = 27
	var estadoActual = estadoJuego
	
	
	method configurarTeclas() {
	
	keyboard.up().onPressDo({estadoActual.alPresionarUp()})
	keyboard.down().onPressDo({estadoActual.alPresionarDown()})
	keyboard.right().onPressDo({estadoActual.alPresionarRight()})
	keyboard.left().onPressDo({estadoActual.alPresionarLeft()})
	keyboard.w().onPressDo({estadoActual.alPresionarUp()})
	keyboard.s().onPressDo({estadoActual.alPresionarDown()})
	keyboard.d().onPressDo({estadoActual.alPresionarRight()})
	keyboard.a().onPressDo({estadoActual.alPresionarLeft()})
	keyboard.e().onPressDo({estadoActual.alPresionarE()})
	keyboard.enter().onPressDo({estadoActual.alPresionarEnter()})
	keyboard.num1().onPressDo({estadoActual.alPresionar1()})
	keyboard.num2().onPressDo({estadoActual.alPresionar2()})
	keyboard.num3().onPressDo({estadoActual.alPresionar3()})
	}
	
	method cambiarEstado(nuevoEstado) {
			estadoActual = nuevoEstado
	}
	
	method configurarColisiones() {
		game.onCollideDo(personaje, {algo => algo.teEncontro()})
	}	
}

class Estado{
	method alPresionarUp(){}
	method alPresionarDown(){}
	method alPresionarRight(){}
	method alPresionarLeft(){}
	method alPresionarE(){}
	method alPresionarEnter(){}
	method alPresionar1(){}
	method alPresionar2(){}
	method alPresionar3(){}
}

object estadoJuego inherits Estado{
	override method alPresionarUp() {
		personaje.moverse(arriba)
	}
	override method alPresionarDown() {
		personaje.moverse(abajo)
	}
	override method alPresionarRight() {
		personaje.moverse(derecha)
	}
	override method alPresionarLeft() {
		personaje.moverse(izquierda)
	}
	override method alPresionarE() {
	}
}

