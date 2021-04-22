import wollok.game.*

// esto vamos a ver si anda

object configuraciones {

	const property altura = 14
	const property ancho = 25
	var estadoActual = estadoMenuInicio
	
	
	method configurarTeclas() {
	
	keyboard.up().onPressDo({estadoActual.alPresionarUp()})
	keyboard.down().onPressDo({estadoActual.alPresionarDown()})
	keyboard.right().onPressDo({estadoActual.alPresionarRight()})
	keyboard.left().onPressDo({estadoActual.alPresionarLeft()})
	keyboard.e().onPressDo({estadoActual.alPresionarE()})
	keyboard.enter().onPressDo({estadoActual.alPresionarEnter()})
	keyboard.num1().onPressDo({estadoActual.alPresionar1()})
	keyboard.num2().onPressDo({estadoActual.alPresionar2()})
	keyboard.num3().onPressDo({estadoActual.alPresionar3()})
	
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

object estadoMenuInicio inherits Estado{
	override method alPresionarEnter() {
	}
}

