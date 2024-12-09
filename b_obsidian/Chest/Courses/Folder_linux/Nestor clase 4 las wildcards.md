[[index]]
[[index_linux]]


## BUSQUEDA
**ASTERIASCO:**
	El #asterisco ubicado al final o al principio para seleccionar los archivos o directorios que terminen o empiezen con la palabra clave, por ejemplo:
```
ls -ld *.conf :
ls -ld *kitty* :
```


**==LLAVE:==**
```
ls -ld [VT]*
ls -ld *[VT]*
```
1. [\ ] : Simbolo de busqueda.
2. * : Todo los que empiezen con 'V' o 'T'.
3. \*[\VT]\* : Todo lo que contenga 'V' y 'T'.


**SIGNO ?:**
```
ls -ld V??: -> Vim
```
1. V?? : La letra 'V' determina la primera letra y el '?' representa la cantidad que caracteres a completar. 


**==MAYUS, MINUS Y NUM:==**
	las #wilcards son comandos de busca para archivos que empiezen, contengan o terminen en minuscula, mayuscula o numeral y del mismo modo `SE PUEDE USAR EL ASTERISCO`.
```
ls -ld [[:lower:]]
ls -ld [[:upper:]]
ls -ld [[:alnum:]]
ls -ld [[:digit:]]

# Ejemplo con asterisco:
ls -ld [[:digit:]]*
ls -ld *[[:digit:]]*
```




## ELIMINAR

**BORRAR TODO:**
	Borrar todos los archivos y carpetas de la ubicacion seleccionada.
```
rm -r ubicacion/* :
```
**BORRAR TODO C/CARACTER:**
	Elimina todo lo que termine con _.png_.
```
rm -r ubicacion/*.png :
```


