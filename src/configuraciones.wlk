object configuraciones {

	const property altura = 14
	const property ancho = 25
	
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
