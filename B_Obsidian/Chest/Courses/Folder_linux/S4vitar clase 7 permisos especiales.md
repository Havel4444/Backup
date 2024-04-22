[[index]]
[[index_linux]]

## PERMISO ESPECIAL: STICKY BIT

**DEFINICION:**
	El permiso #StickyBit deniega los permisos '777 y 666' a archivo y directorios de cualquier usuario pero `SOLO A GRUPOS Y A OTROS`.
**ASIGNACION:**
	Puede ser asignado con el siguiente comando:
```bash
# Modo normal
chmod +t archivo/directorio

# Modo octal
chmod 1777 archivo/directorio
```




## CONTROL DE ATRIBUTOS DE FICHERO: ATTR

**COMANDOS:**
	El #Lsattr visualiza los atributos de fichero.
&&
	El #Chattr hace in-borrable un archivo/directori incluso para el usuario root.
```bash
# Agregar
chattr +i -V archivo/directorio
# Quitar
chattr -i -V archivo/directorio
```

**PERMISOS:**
	"e": Indica que el atributo "append-only" está activado. Cuando este atributo está establecido en un archivo, solo se le permite agregar datos al final del archivo. No se pueden modificar ni eliminar datos existentes.
	"c" o "C": Indica que el atributo "no-clobber" está activado. Este atributo también controla la capacidad de agregar datos al archivo, pero de manera más restrictiva que el atributo "append-only". Si el atributo "c" está establecido, solo los usuarios con capacidad de escritura en el directorio pueden agregar datos al archivo. Si el atributo "C" está establecido, incluso el propietario del archivo no puede agregar datos.




## PERMISO ESPECIAL: SUID Y SGID

**DEFINICION:**
	Los permisos #SUID y #SGID activan la funcion root de forma pasiva.
**COMANDO:**
```bash
# Para usuario con y sin numeracion octal
chmod 4755(4000) directorio
chmod 4644(4000) archivo

# Para grupo con y sin numeracion octal
chmod 2755(2000) directorio
chmod 2644(2000) archivo
```

**EJEMPLO DE USO:**
	En el siguiente ejemplo se vera el paso a paso de como acceder al usiario root de otro linux mediante un _suid_/_sgid_.
	Estando en modo no root.
1. Buscar archivos/directorios con estas funciones activadas y luego filtralas con un redireccionamiento.
```bash
# Usuario
find / -type f -perm -4000 2>/dev/null

# Grupo
find / -type f -perm -2000 2>/dev/null
```
2. Elegir una de la lista, en caso de no tener se puede agregar esta funcion especial. `ACCION EN MODO ROOT`.
```bash
# Usuario
chmod u+s archivo/directorio

# Grupo
chmod g+s archivo/directorio
```
3. Tomaremos de ejemplo al archivo _python3.9_
```bash
$ chmod u+s /usr/bin/python3.9
$ python3.9 # Ejecutamos el archivo SUID
$ import os # Instalamos os(siempre)
$ os.setuid(0) # Entremos en modo ROOT
$ os.system('bash') # Elegimos una SHEEL
```




## PRIVILEGIO ESPECIAL: CAPABILITIES

**DEFINICION:**
	Los permisos #Setcap y #Getcap agregan/eliminan y visualizan de forma mega pasiva al usuario root.
**COMANDOS:**
1. Agregar.
```bash
setcap cap_setuid+ep /usr/bin/python3.9
```
2. Desactivar.
```bash
setcap -r /usr/bin/python3.9
```
4. Visualizar.
```bash
getcap -r / 2>/dev/null
```
6. Visualizar instantaneamente.
```bash
getcap !$
```




## LINK

```
# Permisos especial: sticky bit
https://keepcoding.io/blog/que-es-el-sticky-bit-y-como-configurarlo/
https://www.fpgenred.es/GNU-Linux/el_bit_sticky.html

# Permisos especiales: chattr
https://rm-rf.es/chattr-y-lsattr-visualizar-y-modificar-atributos-en-sistemas-de-ficheros-linux/#:~:text=El%20primer%20comando%2C%20lsattr%20permite,chmod%2C%20chown%2Csetfacl%E2%80%A6)
https://programmerclick.com/article/5604675172/

# Permisos especiales: SUID Y SGID
https://deephacking.tech/permisos-sgid-suid-y-sticky-bit-linux/#:~:text=Permiso%20SGID,-El%20permiso%20SGID&text=Si%20se%20establece%20en%20un,perteneciente%2C%20el%20grupo%20del%20directorio.
https://www.ochobitshacenunbyte.com/2019/06/17/permisos-especiales-en-linux-sticky-bit-suid-y-sgid/
https://www.ibiblio.org/pub/linux/docs/LuCaS/Manuales-LuCAS/SEGUNIX/unixsec-2.1-html/node56.html

# Privilegios especiales: capabilities
http://www.etl.it.uc3m.es/Linux_Capabilities
```
