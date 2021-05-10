class Objeto {

	var categoria
	var peso

}

object escudo {

	var defensa

}

object espada {

	var danio

}

object mochila inherits Objeto {

	const objetosGuardados = []
	const pesoMaximo = -15
	
	method controlarPeso() {
		if (objetosGuardados.sum{ unObjeto => unObjeto.peso() } + pesoMaximo < 0) {
			return true
		}
		return false
	}

	method agregarObjeto(unObjeto) {
		if (self.controlarPeso()) objetosGuardados.add(unObjeto)
	// Mensaje de no puede agregar? No sería error, sabemos otra forma de hacerlo?
	// O sin mensaje pero tampoco agregar, o sea no hacer nada
	}

	method desecharObjeto(unObjeto) {
		objetosGuardados.remove(unObjeto)
	}

}

