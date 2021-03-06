import paquetePrimario.menu.*
import paquetePrimario.imagen.*
import wollok.game.*
import paqueteSecundario.individuos.*
import paquetePrimario.audio.*
import individuos.*

class Objeto inherits Imagen {

	var property peso

	override method interactuarConObjeto() {
		return self
	}

	method utilizarObjeto() {
	// Realiza la accion de dicho objeto
	}

	method sonidoAlAgarrar() {
		game.schedule(100, { audio.reproducirSonido("agarrar")})
	}

	method equiparObjeto() {
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

	var property armadura

	override method equiparObjeto() {
		personaje.recibirArmadura(self.armadura())
		personaje.armaduraEnMano2()
	}

}

object escudoChico inherits Escudo(categoria = "chico", peso = 5, armadura = 2, imagen = "objetos/escudoChico.png", position = menu.posicionEscudoChico()) {

}

object escudoGrande inherits Escudo(categoria = "grande", peso = 10, armadura = 4, imagen = "objetos/escudoGrande.png", position = menu.posicionEscudoGrande()) {

}

class Espada inherits Objeto {

	var property danio

	override method equiparObjeto() {
		personaje.equiparObjetoMano1(self)
	}

}

object espadaChica inherits Espada(categoria = "chico", peso = 5, danio = 1, imagen = "objetos/espadaChica.png", position = menu.posicionEspadaChica()) {

}

object espadaGrande inherits Espada(categoria = "grande", peso = 10, danio = 2, imagen = "objetos/espadaGrande.png", position = menu.posicionEspadaGrande()) {

}

class Mochila inherits Objeto {

	const puedeGuardar = []
	const guardaEnComun = [ llaveAzul, llaveVerde, llaveRoja, corazonCompleto, mochilaChica, mochilaGrande ]
	var property objetosGuardados = []

	method agregarObjeto(unObjeto) {
		const mochilaAcepta = puedeGuardar + guardaEnComun
		if (mochilaAcepta.any({ objetoQueAcepta => objetoQueAcepta == unObjeto }) or unObjeto.categoria() == "llave") {
			unObjeto.sonidoAlAgarrar()
			if (unObjeto.categoria() != "corazonCompleto") {
				objetosGuardados.add(unObjeto)
			}
			unObjeto.equiparObjeto()
				// Agrega la visual del objeto a la zona donde se muestran los objetos que tenes a la derecha de todo
			game.addVisualIn(unObjeto, game.at(unObjeto.position().x(), unObjeto.position().y()))
		} else {
			game.say(self, "Necesitas una mochila Grande Para este objeto")
		}
	}

	method desecharObjeto(unObjeto) {
		objetosGuardados.remove(unObjeto)
	}

	method llaves() = objetosGuardados.filter({ objeto => objeto.categoria() == 'llave' }).size()

	override method equiparObjeto() {
	}

}

object mochilaChica inherits Mochila(puedeGuardar = [ escudoChico, espadaChica ], categoria = "mochilaChica", peso = -15, imagen = "objetos/mochilaChica.png", position = menu.posicionMochilaChica()) {

}

object mochilaGrande inherits Mochila(puedeGuardar = [ escudoGrande, espadaGrande, escudoChico, espadaChica ], categoria = "mochilaGrande", peso = -20, imagen = "objetos/mochilaGrande.png", position = menu.posicionMochilaGrande()) {

}

class Cofre inherits Objeto {

	var property objetoGuardado = null

	override method esAtravesable() {
		return false
	}

	override method interactuarConObjeto() {
		if (objetoGuardado != null and personaje.mochila() != null) {
			if (personaje.cantidadLlaves() > 0) {
				if (objetoGuardado.categoria() == "chico" or objetoGuardado.categoria() == "corazonCompleto" or objetoGuardado.categoria() == "mochilaGrande" or (objetoGuardado.categoria() == "grande" and personaje.mochila().categoria() == "mochilaGrande")) {
					const miLlave = personaje.mochila().objetosGuardados().find({ objeto => objeto.categoria() == 'llave' })
					personaje.utilizarObjeto(miLlave)
					game.addVisualIn(new CofreAbierto(imagen = "cofres/cofreAbierto.png"), game.at(self.position().x(), self.position().y()))
					game.schedule(1, { audio.reproducirSonido("cofre")})
					game.removeVisual(self)
					if (personaje.cantidadLlaves() == 0) {
						menu.removeLlaveCofre()
					}
					return objetoGuardado
				}
				game.say(personaje, "Necesitas una mochila grande")
				return null
			}
			game.say(personaje, "Necesitas una llave para abrir el cofre")
		}
		
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
		game.addVisual(cofreCerrado1Level2)
		game.addVisual(cofreCerrado2Level2)
		game.addVisual(cofreCerrado3Level2)
		game.addVisual(cofreCerrado4Level2)
	}

	method agregarCofresNivel3() {
		game.addVisual(cofreCerrado1Level3)
		game.addVisual(cofreCerrado2Level3)
		game.addVisual(cofreCerrado3Level3)
		game.addVisual(cofreCerrado4Level3)
		game.addVisual(cofreCerrado5Level3)
	}

}

object cofreCerrado1Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(1, 12), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaChica) {

}

object cofreCerrado2Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(15, 1), imagen = "cofres/cofreCerrado.png", objetoGuardado = corazonCompleto) {

}

object cofreCerrado3Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(19, 1), imagen = "cofres/cofreCerrado.png", objetoGuardado = corazonCompleto) {

}

object cofreCerrado4Level1 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(19, 5), imagen = "cofres/cofreCerrado.png", objetoGuardado = escudoChico) {

}

object cofreCerrado1Level2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(19, 7), imagen = "cofres/cofreCerrado.png", objetoGuardado = corazonCompleto) {

}

object cofreCerrado2Level2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(2, 12), imagen = "cofres/cofreCerrado.png", objetoGuardado = mochilaGrande) {

}

object cofreCerrado3Level2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(15, 12), imagen = "cofres/cofreCerrado.png", objetoGuardado = espadaGrande) {

}

object cofreCerrado4Level2 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(8, 1), imagen = "cofres/cofreCerrado.png", objetoGuardado = escudoGrande) {

}

object cofreCerrado1Level3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(1, 1), imagen = "cofres/cofreCerrado.png", objetoGuardado = escudoGrande) {

}

object cofreCerrado2Level3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(7, 3), imagen = "cofres/cofreCerrado.png", objetoGuardado = corazonCompleto) {

}

object cofreCerrado3Level3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(19, 10), imagen = "cofres/cofreCerrado.png", objetoGuardado = corazonCompleto) {

}

object cofreCerrado4Level3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(3, 12), imagen = "cofres/cofreCerrado.png", objetoGuardado = corazonCompleto) {

}

object cofreCerrado5Level3 inherits Cofre(categoria = "cofre", peso = 0, position = game.at(4, 10), imagen = "cofres/cofreCerrado.png", objetoGuardado = corazonCompleto) {

}

class CofreAbierto inherits Imagen {

	override method esAtravesable() {
		return false
	}

}

class Llave inherits Objeto {

	override method utilizarObjeto() {
		personaje.mochila().desecharObjeto(self)
		if (!personaje.mochila().objetosGuardados().any({ objeto => objeto.categoria() == self.categoria()})) {
			game.removeVisual(self)
		}
	}

	override method sonidoAlAgarrar() {
		game.schedule(1, { audio.reproducirSonido("llave")})
	}

}

object llaveAzul inherits Llave(categoria = "llaveAzul", peso = 0, imagen = "llave/llaveAzul.png", position = menu.posicionLlaveAzul()) {

}

object llaveVerde inherits Llave(categoria = "llaveVerde", peso = 0, imagen = "llave/llaveVerde.png", position = menu.posicionLlaveVerde()) {

}

object llaveRoja inherits Llave(categoria = "llaveRoja", peso = 0, imagen = "llave/llaveRoja.png", position = menu.posicionLlaveRoja()) {

}

class Corazon inherits Objeto {

	override method equiparObjeto() {
		self.utilizarObjeto()
	}

	override method utilizarObjeto() {
		personaje.recibirVida(2)
	}

	override method sonidoAlAgarrar() {
		game.schedule(1, { audio.reproducirSonido("vida")})
	}

}

object corazonCompleto inherits Corazon(categoria = "corazonCompleto", peso = 0) {

}

