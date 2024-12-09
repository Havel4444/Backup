[[index]]
[[index_linux]]

# TERMINAL

**VISUALIZAR EL PESO DE LOS ARCHIVOS:**
	1. ls
	2. xargs du -h: Muestra el peso de los archivos.
	3. sort -h: ordena de menor a mayor.
```
ls | xargs du -h | sort -h
```
**FZF PARA VISULIZAR:**
	 En caso de usar 'fzf' usar '--tac' para ordernarlo de menor a mayor.
```
ls | xargs du -h | sort -h |fzf --tac
```


# RED

**IP PRIVADA DEL US:**
	El comando 'ifconfig' muestra la direccion IP, la mascara de red, la puerta de enlace predeterminada y otras opciones de red.
```
ifconfig
```


**IP PRIVADA DE DISPOSITIVOS:**
	Asi como la ip privada del router que es usada tambien como coneccion LAN,
	la gran mayoria de dispositivos vinculadas a una red tiene una direccion ip privada e ip MAC que la diferencian del resto, por ejemplo, los cajeros automaticos, consolas e impresoras.


**IP PUBLICA DEL US Y DE LOS DISPOSITIVOS:**
	`No existen`.


==IP PRIVADA E IP PUBLICA DEL INTERNET:==
	`La ip privada de internet` es una ip diferente a ipLAN o ipROUTER. Esta ip puede estar en modo estatica o dinamica para mayor seguridad. Esta misma tambien esta acompana de una puerta de enlace que la vincula con el internet y `puede cambiar` de manera automatica al colocar el modo dinamico.
	`La ip publica de internet` es la ip con la que se identifica tu red en el exterior y esta misma no puede cambiar al modo estatico porque viene por `preterminado como dinamico` ya que para tener el modo estatido se tiene que pagar, por ejemplo, para sostener una pagina web.
**VISUALIZAR LA IP PUBLICA**
```
curl ifconfig.me
```


# VIM

**RUTAS:**
	Ubicacion base del la configuracion de _vimrc_. Eliminar _set nu_ y _set list_. Este archivo solo podra ser modificado en modo ROOT.
```
/usr/share/vim/vimrc
```






# LINKS
Comandos basicos de linux:
https://www.fing.edu.uy/inco/cursos/sistoper/recursosLaboratorio/tutorial0.pdf






