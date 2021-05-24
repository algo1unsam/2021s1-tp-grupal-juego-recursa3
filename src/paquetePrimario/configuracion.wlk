import wollok.game.*
import paqueteSecundario.direcciones.*
import paqueteSecundario.individuos.*
import paqueteSecundario.estados.*

object configuraciones {

	const property altura = 14
	const property ancho = 27
	var estadoActual = juego

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
	keyboard.space().onPressDo({estadoActual.alPresionarSpace()})
	}

	method cambiarEstado(nuevoEstado) {
			estadoActual = nuevoEstado
	}

	method configurarColisiones() {
		game.onCollideDo(personaje, {algo => algo.teEncontro()})
	}
}