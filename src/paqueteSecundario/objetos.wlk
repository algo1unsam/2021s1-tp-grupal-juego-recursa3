import paquetePrimario.menu.*
import paquetePrimario.imagen.*
import wollok.game.*
import paqueteSecundario.individuos.*
import paquetePrimario.audio.*

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
		game.addVisualIn(new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre()), game.at(5, 8))
		game.addVisualIn(mochilaChica, game.at(3, 1))
		game.addVisualIn(llaveAzul, game.at(11, 2))
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

	method agregarObjeto(unObjeto) {
		if (unObjeto.categoria() == "espada") {
			objetosGuardados.add(unObjeto)
			personaje.equiparObjetoMano1(unObjeto)
			game.schedule(100, { audio.reproducirSonido("agarrar")})
		}
		if (unObjeto.categoria() == "escudo") {
			objetosGuardados.add(unObjeto)
			personaje.equiparObjetoMano2(unObjeto)
			game.schedule(100, { audio.reproducirSonido("agarrar")})
		}
			// Al encontrar una mochila la cambia por la que ya tiene
		if (unObjeto.categoria() == "mochila") {
			peso = unObjeto.peso()
			imagen = unObjeto.imagen()
			game.schedule(1, { audio.reproducirSonido("agarrar")})
		}
		if (unObjeto.categoria() == "llave") {
			objetosGuardados.add(unObjeto)
			game.schedule(1, { audio.reproducirSonido("llave")})
		}
		if(unObjeto.categoria() == "llaveAzul") {
			objetosGuardados.add(unObjeto)
			game.schedule(1, { audio.reproducirSonido("llave")})
		}
		if(unObjeto.categoria() == "llaveVerde") {
			objetosGuardados.add(unObjeto)
			game.schedule(1, { audio.reproducirSonido("llave")})
		}
		if(unObjeto.categoria() == "llaveRoja") {
			objetosGuardados.add(unObjeto)
			game.schedule(1, { audio.reproducirSonido("llave")})
		}
			// Agrega la visual del objeto a la zona donde se muestran los objetos que tenes a la derecha de todo
		game.addVisualIn(unObjeto, game.at(unObjeto.position().x(), unObjeto.position().y()))
	}

	override method interactuarConObjeto() {
		return self
	}

	method desecharObjeto(unObjeto) {
		objetosGuardados.remove(unObjeto)
	}

	method objetosGuardados() = objetosGuardados

	method llaves() = objetosGuardados.filter({ objeto => objeto.categoria() == 'llave' }).size()

}

object mochilaChica inherits Mochila(categoria = "mochila", peso = -15, imagen = "objetos/mochilaChica.png", position = menu.posicionMochilaChica()) {

}

object mochilaGrande inherits Mochila(categoria = "mochila", peso = -20, imagen = "objetos/mochilaGrande.png", position = menu.posicionMochilaGrande()) {

}

class Cofre inherits Objeto {

	var property objetoGuardado = null
	
	override method esAtravesable(){
		return false
	}

	override method interactuarConObjeto() {
		if (objetoGuardado != null && personaje.mochila() != null) {
			if (personaje.cantidadLlaves() > 0) {
				const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == 'llave' })
				personaje.utilizarObjeto(miLlave)
				game.addVisualIn(new CofreAbierto(imagen = "cofres/cofreAbierto.png", peso = 0), game.at(self.position().x(), self.position().y()))
				game.schedule(1, { audio.reproducirSonido("cofre")})
				game.removeVisual(self)
				if(personaje.cantidadLlaves() == 0){
					menu.removeLlaveCofre()
				}
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
		game.addVisual(cofreCerrado3Level1)
		game.addVisual(cofreCerrado4Level1)
	}

	method agregarCofresNivel2() {
		// Podriamos hacer game.addVisualIn(cofreCerradoLevel2, position) para poner varios?
		game.addVisual(cofreCerrado1Level2)
		game.addVisual(cofreCerrado2Level2)
		game.addVisual(cofreCerrado3Level2)
	}

	method agregarCofresNivel3() {
		// Podriamos hacer game.addVisualIn(cofreCerradoLevel2, position) para poner varios?
		game.addVisual(cofreCerradoLevel3)
	}

}

object cofreCerrado1Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(1, 12), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaChica) {

}

object cofreCerrado2Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(15, 1), imagen = "cofres/cofreCerrado.png", objetoGuardado = new CorazonCompleto(peso = 0)) {

}

object cofreCerrado3Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(19, 1), imagen = "cofres/cofreCerrado.png", objetoGuardado = new CorazonCompleto(peso = 0)) {

}

object cofreCerrado4Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(19, 5), imagen = "cofres/cofreCerrado.png", objetoGuardado = escudoChico) {

}

//Elegir donde va
object cofreCerrado1Level2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(19, 7), imagen = "cofres/cofreCerrado.png", objetoGuardado = new CorazonCompleto(peso = 0)) {

}

object cofreCerrado2Level2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(2, 12), imagen = "cofres/cofreCerrado.png", objetoGuardado = mochilaGrande) {

}

object cofreCerrado3Level2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(15, 12), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaGrande) {

}

//Elegir donde va
object cofreCerradoLevel3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(11, 2), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaGrande) {

}

class CofreAbierto inherits Cofre {

}

class Llave inherits Objeto {

	override method utilizarObjeto() {
		personaje.mochila().desecharObjeto(self)
		if (!personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == self.categoria()})){
			game.removeVisual(self)
		}
	}

}


object llaveAzul inherits Llave(categoria = "llaveAzul", peso = 0, imagen = "llave/llaveAzul.png", position = menu.posicionLlaveAzul()) {

}

object llaveVerde inherits Llave(categoria = "llaveVerde", peso = 0, imagen = "llave/llaveVerde.png", position = menu.posicionLlaveVerde()) {

}

object llaveRoja inherits Llave(categoria = "llaveRoja", peso = 0, imagen = "llave/llaveRoja.png", position = menu.posicionLlaveRoja()) {

}

class CorazonCompleto inherits Objeto {

}

class CorazonMitad inherits Objeto {

}

class CorazonVacio inherits Objeto {

}

