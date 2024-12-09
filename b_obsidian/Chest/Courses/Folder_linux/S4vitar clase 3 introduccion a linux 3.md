[[index]]
[[index_linux]]
[[linux_and_red]]
### ANNOTATIONS
##### COMANDOS:
**Concadenacion**.
Muestra el directorio acutual y sus archivos.
```
pwd; ls
```
**Concadenacion continua**.
El segundo comando se ejecuta si el primero tambien lo hace.
```
pwd && ls
```
**Concadenacion dis-continua.**
```
pwd || ls
```

**`ERROR: CODIGO DE ESTADO`**
Cuando ocurre un error te muestra un numero diferente a '0'.
```
echo $?
```

%%Cuando se ejecuta un comando erroneo agregar la siguiente lina para no verlo%%
```
Redirige la salida de error estandar al tacho.
-># lss 2>/dev/null

Redirige la salida estandar y la salida avanzada de error al tacho:
-># lss &>/dev/null

Segundo plano: Muestra una nuemro PID de referencia. Este es un proceso hijo de la terminal en uso lo que te impide cerrarlo
-># lss &>/dev/null &

Separarse del segundo plano: Separa el la terminal padre del proceso hijo. En resumen, este comando se utiliza para ejecutar un comando en segundo plano sin mostrar ninguna salida en la terminal y sin depender del terminal actual.
-># lss &>/dev/null & disown
```



### EXAMPLES AND MORE



### CONCLUSION
echo $?:
Puede utlizarse en scripts de bash para una esctructura 'if', si el valor es '0' hacer esto y si no es hacer esto otro.

&>/dev/null: 
El codigo comun a usar para no ver el error es '&>/dev/null'. Los siguientes niveles de este comando son en caso de vincularlos con un programa o aplicacion externa.




