import paquetePrimario.imagen.*
import wollok.game.*
import paqueteSecundario.individuos.*

class Objeto inherits Imagen {

	var property categoria
	var property peso

	override method interactuarConObjeto() {
		return self
	}

	method utilizarObjeto() {
	// Realiza la accion de dicho objeto
	}

}

object objetos {

	method agregarObjetosNivel1() {
		game.addVisualIn(llave, game.at(5, 5))
		game.addVisualIn(mochilaChica, game.at(3, 1))
	}

}

class Escudo inherits Objeto {

	var property defensa

}

object escudoChico inherits Escudo(categoria = "escudo", peso = 5, defensa = 10, imagen = "objetos/escudoChico.png", position = game.at(23, 4)) {

}

object escudoGrande inherits Escudo(categoria = "escudo", peso = 10, defensa = 20, imagen = "objetos/escudoGrande.png", position = game.at(23, 4)) {

}

class Espada inherits Objeto {

	var property danio

}

object espadaChica inherits Espada(categoria = "espada", peso = 5, danio = 10, imagen = "objetos/espadaChica.png", position = game.at(23, 5)) {

}

object espadaGrande inherits Espada(categoria = "espada", peso = 10, danio = 20, imagen = "objetos/espadaGrande.png", position = game.at(24, 5)) {

}

class Mochila inherits Objeto {

	const objetosGuardados = []
	var property llaves = 0

	method controlarPeso() {
		return objetosGuardados.sum{ unObjeto => unObjeto.peso() } - peso <= 0
	}

	method agregarObjeto(unObjeto) {
		// if (self.controlarPeso()){
		if (unObjeto.categoria() == "espada") {
			// No puede tener mas de 2 espadas
			if (objetosGuardados.filter({ unObjetoGuardado => unObjetoGuardado.categoria() == "espada" }).size() < 1) {
				objetosGuardados.add(unObjeto)
				personaje.equiparObjeto(unObjeto)
			} else {
				// game.say(personaje, "No puedes tener mas de 2 espadas, desecha una primero")
				personaje.desecharObjeto(self.objetosGuardados().find({ objeto => objeto.categoria() == "espada"}))
				objetosGuardados.add(unObjeto)
				personaje.equiparObjeto(unObjeto)
			}
		}
		if (unObjeto.categoria() == "escudo") {
			// No puede tener mas de 1 escudo.
			if (objetosGuardados.filter({ unObjetoGuardado => unObjetoGuardado.categoria() == "escudo" }).size() < 1) {
				objetosGuardados.add(unObjeto)
			// personaje.equiparObjeto(unObjeto)
			} else {
				personaje.desecharObjeto(self.objetosGuardados().find({ objeto => objeto.categoria() == "escudo"}))
				objetosGuardados.add(unObjeto)
			}
		}
			// Al encontrar una mochila la cambia por la que ya tiene
		if (unObjeto.categoria() == "mochila") {
			peso = unObjeto.peso()
			imagen = unObjeto.imagen()
		}
		if (unObjeto.categoria() == "llave") {
			llaves += 1
		}
			// Agrega la visual del objeto a la zona donde se muestran los objetos que tenes a la derecha de todo
		game.addVisualIn(unObjeto, game.at(unObjeto.position().x(), unObjeto.position().y()))
//		}else{
//			game.say(personaje, "No tenes espacio para llevar este objeto, desecha uno primero para ganar mas espacio")
//		}
	}

	override method interactuarConObjeto() {
		return self
	}

	method desecharObjeto(unObjeto) {
		objetosGuardados.remove(unObjeto)
	}

	method usarLlave() {
		llaves -= 1
	}

	method objetosGuardados() = objetosGuardados

}

object mochilaChica inherits Mochila(categoria = "mochila", peso = -15, imagen = "objetos/mochilaChica.png", position = game.at(23, 6)) {

}

object mochilaGrande inherits Mochila(categoria = "mochila", peso = -20, imagen = "objetos/mochilaGrande.png", position = game.at(23, 6)) {

}

class Cofre inherits Objeto {

	var property objetoGuardado = null

	override method interactuarConObjeto() {
		if (objetoGuardado != null && personaje.mochila() != null) {
			if (personaje.cantidadLlaves() > 0) {
				personaje.utilizarObjeto(llave)
				game.addVisualIn(cofreAbierto, game.at(self.position().x(), self.position().y()))
				game.removeVisual(self)
				return objetoGuardado
			}
		}
		game.say(personaje, "Necesitas una llave para abrir el cofre")
		return null
	}

}

object cofres {

	method agregarCofresNivel1() {
		game.addVisual(cofreCerradoLevel1)
	}

	method agregarCofresNivel2() {
		// Podriamos hacer game.addVisualIn(cofreCerradoLevel2, position) para poner varios?
		game.addVisual(cofreCerradoLevel2)
	}

	method agregarCofresNivel3() {
		// Podriamos hacer game.addVisualIn(cofreCerradoLevel2, position) para poner varios?
		game.addVisual(cofreCerradoLevel3)
	}

}

object cofreCerradoLevel1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(11, 2), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaChica) {

}

//Elegir donde va
object cofreCerradoLevel2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(11, 2), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaChica) {

}

//Elegir donde va
object cofreCerradoLevel3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(11, 2), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaChica) {

}

object cofreAbierto inherits Imagen(imagen = "cofres/cofreAbierto.png") {

}

object llave inherits Objeto (categoria = "llave", peso = 0, imagen = "llave/llave.png", position = game.at(24, 6)) {

	override method utilizarObjeto() {
		personaje.mochila().usarLlave()
		if (personaje.mochila().llaves() == 0) {
			game.removeVisual(self)
		}
	}

}

