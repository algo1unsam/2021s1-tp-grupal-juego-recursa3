<img src="picture\presentacion\recursa3.jpg" width='600'>

# ```Diagrama de Arquitectura```
<img src="picture\presentacion\tp_algo1.drawio.png">

# ```Conceptos de los metodos```
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
        1.  controlarPeso() # Controla si la suma de los objetos que contiene es mayor que 0
        2.  agregarObjeto(unObjeto) # Este metodo revisara el objeto que intenta agarra y controlara si puede o no guardarlos. Por ejemplo: No puede tiene mas de 1 ecudo ni mas de 2 espadas
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