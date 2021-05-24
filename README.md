<img src="picture\presentacion\recursa3.jpg" width='600'>
<br><br>

#   ```INSTRUCCIONES DEL JUEGO```
<img src="picture\presentacion\movimientos.png">
<br><br>
<img src="picture\presentacion\objetos.png">

<br><br>

#   ```DIAGRAMA DE ARQUITECTURA```
<img src="picture\presentacion\tp_algo1.drawio.png">
<br><br>

# ```CONCEPTOS DE LOS METODOS```
# objetos.wlk:
*   ### Clase Objeto:
    ```python
        1.  interactuarConObjeto() # Dependera de cada objeto
        2.  utilizarObjeto()    # Dependera de cada objeto
    ```
*   ### Clase Espada:
    ```python
        1.  utilizarObjeto()    # Se utiliza para realizar el ataque con el objeto
    ```
*   ### Clase Mochila:
    ```python
        1.  controlarPeso() # Controla si la suma de los objetos que contiene es mayor que 0, en caso de ser mayor devolvera false. 
        2.  agregarObjeto(unObjeto) # Este metodo revisara el objeto que intenta agarra y procedera a desechar en caso de ya tener el objeto para agarra el nuevo. 
        3.  interactuarConObjeto()  # Pendiente
        4.  desecharObjeto(unObjeto) # Se utiliza para remover un objeto de la mochila
        5.  usarLlave() # Utiliza una llave de la mochila -1
    ```
*   ### Clase Cofres:
    ```python
        1.  interactuarConObjeto() # Procederá a validar que el cofre no este vacío y que el personaje tenga algún objeto guardado y que tenga una llave. Luego de validar utilizara la llave o saldrá un mensaje de advertencia 
    ```
*   ### Objeto llave:
    ```python
        1.  utilizarObjeto() # Utilizara el methodo usarLlave de la clase Mochila y luego validara si no hay mas llaves en la mochila para remover la imagen
    ```
<br><br>

# individuos.wlk:
*   ### Clase Individuo:
    ```python
        1.  moverse(direccion) # Controla el movimiento y direccion del personaje
        2.  moverHaciaSiSePuede(personaje, direccion) # Controlara si puede atravezar un obstaculo
        3.  puedeMoverse(posicion) # Hace el llamado de moverHaciaSiSePuede para controlar que pueda moverse
        4.  moverHacia(personaje, direccion) # Se ultiliza para mover de posicion al personaje
        5.  atacar() # Pendiente
    ```
*   ### Objeto personaje:
    ```python
        1.  equiparObjeto(unObjeto) # Equipara un objeto a la mano 1
        2.  utilizarObjeto(unObjeto) # Usara el metodo utilizarObjeto del objeto que tenga equipado
        3.  agregarObjeto(unObjeto) # Revisara si el objeto que quiere agregar es una mochila le agregara la mochila como un atributo al personaje. En caso de querer agarrar un objeto distinto de la mochila, revisara si el personaje tiene una mochila y llamara al methodo de la mochila agregarObjeto. De lo contrario arrojara un mensaje.
        4.  desecharObjeto(unObjeto) # Desechara el objeto que se le pase como parametro. 
        5.  cantidadLlaves() # Devolvera la consutla a la mochila de las llaves()
        6.  atacar() # Revisara si el personaje tiene algun objeto en la mano para poder atacar, en caso de haber un enemigo en frente, procede a quitarle vida. Sino sale un mensaje de que no se puede atacar por no tener un objeto en la mano. 
    ```
*   ### Objeto enemigo:
    ```python
        1.  atacar() # Pendiente
        2.  agregarEnemigoNivel1()
        3.  recibirDanio(danio) # Se le restara vida
    ```
    <br><br>

    # TEST REALIZADOS
    ```python
        import paqueteSecundario.individuos.*
        import paqueteSecundario.objetos.*
        import wollok.game.*
        import paquetePrimario.configuracion.*
        import paqueteSecundario.direcciones.*

        describe "TEST DE INDIVIDUO" {

            const enemigo1 = new Enemigo(vida = 2, ataque = 1, position = game.at(5, 6), orientacion = arriba, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo')

            fixture {
                personaje.position(game.at(5, 5))
                personaje.orientacion(arriba)
                game.addVisual(enemigo1)
                game.addVisual(personaje)
                configuraciones.configurarColisiones()
                personaje.agregarObjeto(mochilaGrande)
                personaje.agregarObjeto(espadaChica)
                personaje.agregarObjeto(escudoGrande)
                game.onTick(1000, "Perseguir1", { true}) // Se hardcodea porque el enemigo en el juego se mueve y es necesario para testear.
            }

            test "EL INDIVIDUO TIENE MOCHILA GRANDE Y DENTRO DE LA MOCHILA TIENE UNA ESPADA CHICA Y UN ESCUDO GRANDE" {
                assert.equals(mochilaGrande, personaje.mochila())
                assert.equals([ espadaChica, escudoGrande ], mochilaGrande.objetosGuardados())
            }

            test "EL INDIVIDUO DECIDE DEJAR UN OBJETO PORQUE LE OCUPA ESPACIO" {
                personaje.desecharObjeto(espadaChica)
                assert.equals([ escudoGrande ], mochilaGrande.objetosGuardados())
            }

            test "EL INDIVIDUO AL AGARRAR LA ESPADA GRANDE DESECHA LA ESPADA CHICA." {
                personaje.agregarObjeto(espadaGrande)
                assert.notThat(mochilaGrande.objetosGuardados().any({ objeto => objeto == espadaChica}))
                assert.notThat(personaje.mano1() == espadaChica)
                assert.that(mochilaGrande.objetosGuardados().any({ objeto => objeto == espadaGrande}))
                assert.that(personaje.mano1() == espadaGrande)
            }

            test "EL personaje AGARRA 3 LLAVES Y UTILIZA UNA, LE QUEDAN 2" {
                3.times({ i => personaje.agregarObjeto(llave)})
                personaje.utilizarObjeto(llave)
                assert.equals(2, personaje.cantidadLlaves())
            }

            test "EL personaje ATACA A UN RIVAL HASTA DEJARLO CON 50 VIDA" {
                personaje.atacar()
                assert.equals(1, enemigo1.vida())
            }

            test "EL personaje ATACA AL enemigo1 HASTA MATARLO" {
                2.times({ i => personaje.atacar()})
                assert.equals(0, enemigo1.vida())
                assert.notThat(game.hasVisual(enemigo1))
            }

            test "EL ENEMIGO ATACA personaje, Y ESTE QUEDA CON 3 PUNTOS DE VIDA." {
                personaje.moverse(arriba)
                assert.equals(personaje.position(), enemigo1.position())

                assert.equals(3, personaje.vida())
            }

        }
    ```
