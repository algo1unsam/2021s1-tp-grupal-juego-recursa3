import paquetePrimario.menu.*
import paquetePrimario.imagen.*
import wollok.game.*
import paqueteSecundario.individuos.*

class Objeto inherits Imagen {

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
		game.addVisualIn(llaveCofre, game.at(5, 5))
		game.addVisualIn(llaveCofre2, game.at(9, 4))
		game.addVisualIn(mochilaChica, game.at(3, 1))
	}

}

class Escudo inherits Objeto {

	var property defensa

}

object escudoChico inherits Escudo(categoria = "escudo", peso = 5, defensa = 1, imagen = "objetos/escudoChico.png", position = menu.posicionEscudoChico()) {

}

object escudoGrande inherits Escudo(categoria = "escudo", peso = 10, defensa = 2, imagen = "objetos/escudoGrande.png", position = menu.posicionEscudoGrande()) {

}

class Espada inherits Objeto {

	var property danio

}

object espadaChica inherits Espada(categoria = "espada", peso = 5, danio = 1, imagen = "objetos/espadaChica.png", position = menu.posicionEspadaChica()) {

}

object espadaGrande inherits Espada(categoria = "espada", peso = 10, danio = 2, imagen = "objetos/espadaGrande.png", position = menu.posicionEspadaGrande()) {

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
				personaje.equiparObjetoMano1(unObjeto)
			} else {
				// game.say(personaje, "No puedes tener mas de 2 espadas, desecha una primero")
				personaje.desecharObjeto(self.objetosGuardados().find({ objeto => objeto.categoria() == "espada"}))
				objetosGuardados.add(unObjeto)
				personaje.equiparObjetoMano1(unObjeto)
			}
		}
		if (unObjeto.categoria() == "escudo") {
			// No puede tener mas de 1 escudo.
			if (objetosGuardados.filter({ unObjetoGuardado => unObjetoGuardado.categoria() == "escudo" }).size() < 1) {
				objetosGuardados.add(unObjeto)
			 	personaje.equiparObjetoMano2(unObjeto)
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

object mochilaChica inherits Mochila(categoria = "mochila", peso = -15, imagen = "objetos/mochilaChica.png", position = menu.posicionMochilaChica()) {

}

object mochilaGrande inherits Mochila(categoria = "mochila", peso = -20, imagen = "objetos/mochilaGrande.png", position = menu.posicionMochilaGrande()) {

}

class Cofre inherits Objeto {

	var property objetoGuardado = null

	override method interactuarConObjeto() {
		if (objetoGuardado != null && personaje.mochila() != null) {
			if (personaje.cantidadLlaves() > 0) {
				personaje.utilizarObjeto(llaveCofre)
				game.addVisualIn(new CofreAbierto(imagen = "cofres/cofreAbierto.png"), game.at(self.position().x(), self.position().y()))
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
		game.addVisual(cofreCerrado1Level1)
		game.addVisual(cofreCerrado2Level1)
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

object cofreCerrado1Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(11, 2), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaChica) {

}

object cofreCerrado2Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(15, 1), imagen = "cofres/cofreCerrado.png", objetoGuardado = escudoChico) {

}


//Elegir donde va
object cofreCerradoLevel2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(10, 2), imagen = "cofres/cofreCerrado.png", objetoGuardado = escudoGrande) {

}

//Elegir donde va
object cofreCerradoLevel3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(11, 2), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaGrande) {

}

class CofreAbierto inherits Imagen {

}

class Llave inherits Objeto {

	override method utilizarObjeto() {
		personaje.mochila().usarLlave()
		if (personaje.mochila().llaves() == 0) {
			game.removeVisual(self)
		}
	}

}

object llaveCofre inherits Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()) {

}

object llaveCofre2 inherits Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()) {

}

object llaveAzul inherits Llave(categoria = "llave", peso = 0, imagen = "llave/llaveAzul.png", position = menu.posicionLlaveAzul()) {

}

object llaveRoja inherits Llave(categoria = "llave", peso = 0, imagen = "llave/llaveRoja.png", position = menu.posicionLlaveRoja()) {

}

object llaveVerde inherits Llave(categoria = "llave", peso = 0, imagen = "llave/llaveVerde.png", position = menu.posicionLlaveVerde()) {

}

object corazonCompletoPersonaje1 inherits Imagen(imagen = "corazones/corazonCompleto.png") {

}

object corazonCompletoPersonaje2 inherits Imagen(imagen = "corazones/corazonCompleto.png") {

}

object corazonCompletoPersonaje3 inherits Imagen(imagen = "corazones/corazonCompleto.png") {

}

object corazonMitadPersonaje1 inherits Imagen(imagen = "corazones/corazonMitad.png") {

}

object corazonMitadPersonaje2 inherits Imagen(imagen = "corazones/corazonMitad.png") {

}

object corazonMitadPersonaje3 inherits Imagen(imagen = "corazones/corazonMitad.png") {

}

object corazonVacioPersonaje1 inherits Imagen(imagen = "corazones/corazonVacio.png") {

}

object corazonVacioPersonaje2 inherits Imagen(imagen = "corazones/corazonVacio.png") {

}

object corazonVacioPersonaje3 inherits Imagen(imagen = "corazones/corazonVacio.png") {

}

object corazonCompletoEnemigo1 inherits Imagen(imagen = "corazones/corazonCompleto.png") {

}

object corazonCompletoEnemigo2 inherits Imagen(imagen = "corazones/corazonCompleto.png") {

}

object corazonCompletoEnemigo3 inherits Imagen(imagen = "corazones/corazonCompleto.png") {

}

object corazonMitadEnemigo1 inherits Imagen(imagen = "corazones/corazonMitad.png") {

}

object corazonMitadEnemigo2 inherits Imagen(imagen = "corazones/corazonMitad.png") {

}

object corazonMitadEnemigo3 inherits Imagen(imagen = "corazones/corazonMitad.png") {

}

object corazonVacioEnemigo1 inherits Imagen(imagen = "corazones/corazonVacio.png") {

}

object corazonVacioEnemigo2 inherits Imagen(imagen = "corazones/corazonVacio.png") {

}

object corazonVacioEnemigo3 inherits Imagen(imagen = "corazones/corazonVacio.png") {

}

