[[index]]
[[index_linux]]

## PERMISOS Y GRUPOS

**GREAGAR Y QUITAR:**
	Los #permisos pueden ser agregados con el siguiente comando.
```
# agregar permisos en todos los grupos.
chmod u+w,g+w,o-r
```
**==NUM NOTACION ACTAL==:**
	Cada permiso 'r,w,x' tiene un valor numero #Octal.
1. r: 4
2. w: 2
3. x: 1
&&
	La enumeracion octal te permite agregar permisos de manera mas rapida y limpia. Por ejemplo.
```
# Agregar todos los permisos al usuario, permisos de lectura y ejecucion al
# grupo y sin permisos para otro.
chmod 750 archivo
```

**AÑADIR GRUPOS:**
	Dentro de lo permitido donde estan los grupos y otros pueden agregarse con el siguiente comando:
```
chgrp havel archivo
``` 

**CONFIGURACION:**
	En el caso de la carpeta juan, si este mismo no esta añadido en usuarios o grupos no podra tener acceso a su configuracion por ejemplo los alias.
```
# Dentre del grupo 'clientes' esta juan agregado.
drwxr-xr-x 31 havel havel      4096 nov 23 16:20 havel
drwxrwx---  2 root  clientes   4096 nov 23 16:18 juan

# En este caso el usuario juan no podra acceder a su configuracion porque no tiene permisos de usuario ni de grupo en la carpeta 'juan'
drwxr-xr-x 31 havel havel      4096 nov 23 16:20 havel
drwxrwx---  2 root  havel   4096 nov 23 16:18 juan
```


## USUARIO

**Ubicacion:**
	El archivo que contiene a cada #Usuario.
```
cat /etc/passwd
```
&&
	Cada campo esta separado por un ':' y cada uno contiene:
1. Nombre de usuario.
2. Contraseña.
3. ID del usuario.
4. ID del grupo principal.
5. Informacion del usuario.
6. Ubicacion.
7. Shell utilizado.

**CREACION, ELIMINACION Y VISUALIZACION:**
	Los siguientes comando tambien crearan y eliminaran los directorios simbolicos.
	Luego de ser creados es `OBLIGATORIO` vincular al usuario a su carpeta de configuracion '/home/usuario' para una 
	Por alguna razon si lo creo con una shell bash el sistema produce errores como el siguiente -> bash: /dev/stderr: Permission denied.
```bash
	# Crear
	useradd ramon -s /bin/zsh -d /home/ramon
	
	# Eliminar
	# En el caso de ser eliminado y porteriormente agregado 
	# como 'usuario'/'grupo'
	# el nombre sera remplazado por su numero identificador respectivamente.
	userdel -r ramon

	# visualizar usuarios
	cut -d: -f1 /etc/passwd
	# Visualizar el contenido del usuario 
	cat /etc/password | grep 'usuario'
```




## GRUPO
- El #Group puede ser usado para ver en que grupos esta el usuario actual. Ejemplo:
```sh
groups 
```

**UBICACION:**
	El archivo que contiene a cada #Grupo.
```bash
	# visualizar usuarios
	cut -d: -f1 /etc/group
	# Visualizar el contenido del usuario 
	cat /etc/password | grep 'usuario'
```

**PERMISOS:**
	Los grupos pueden asignarse con el siguiente comando:
```bash
# para grupos
chgrup havel archivo

# usuario
chown havel archivo

# usuario y grupo
chown havel:havel archivo
```

**CREACION:**
	Codigo de creacion de un grupo contenedor.
```bash
groupadd manada
```
**AGREGACION:**
	A los grupos 'contenedores' como la misma palabra lo dice es les puede añadir usuarios.
```bash
usermod -a -G manada havel
```





## LINK

```bash
# Notacion octal
https://blog.alcancelibre.org/staticpages/index.php/permisos-sistema-de-archivos

# permisos
https://www.hostinger.es/tutoriales/cambiar-permisos-y-propietarios-linux-linea-de-comandos/
https://www.softzone.es/linux/tutoriales/permisos-archivos-directorios-linux/

# propietario y permisos
https://atareao.es/tutorial/terminal/propietarios-y-permisos/

```
