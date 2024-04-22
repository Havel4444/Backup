[[index]]
[[index_linux]]

# IF, ELIF, ELSE and FI

#### BREAK
La diferencia en el comportamiento del comando `break` en los dos fragmentos de código que has proporcionado se debe a la posición de `break` en relación con la estructura condicional `if`. Vamos a explorar cómo cada posición afecta el flujo del bucle:

### Primer Fragmento
```bash
for path in "${paths[@]}"; do
    if cp "$path/$file" "$path_backup/B_$file" 2>/dev/null && echo $?; then
        echo "Archivo $file copiado"
        break
    fi
done
```
**Cómo funciona:**
- El bucle `for` itera sobre cada elemento en la lista `paths`.
- Dentro del bucle, se ejecuta el comando `cp` para copiar un archivo desde `$path/$file` a `$path_backup/B_$file`. Si la copia es exitosa (indicada por `cp` devolviendo `0` y `echo $?` imprimiendo el código de salida), se entra al bloque `if`.
- Si el `if` es verdadero, se imprime "Archivo $file copiado" y luego se ejecuta el `break`. Esto significa que **inmediatamente después de copiar con éxito el primer archivo y mostrar el mensaje, el bucle se interrumpe y no se continúa con los siguientes elementos de `paths`**.

### Segundo Fragmento
```bash
for path in "${paths[@]}"; do
    if cp "$path/$file" "$path_backup/B_$file" 2>/dev/null && echo $?; then
        echo "Archivo $file copiado"
    fi
    break
done
```
**Cómo funciona:**
- Al igual que antes, el bucle `for` comienza a iterar sobre la lista `paths`.
- El comando `cp` se ejecuta y, si es exitoso, se entra al bloque `if` donde se imprime "Archivo $file copiado".
- **Sin importar si el comando `cp` fue exitoso o no, el comando `break` se ejecuta justo después del bloque `if`, pero aún dentro del bucle `for`. Esto significa que el bucle se interrumpirá después de la primera iteración, sin importar el resultado de la copia.**

**Conclusión:**
- En el primer fragmento, `break` sólo se ejecuta si la copia es exitosa, deteniendo el bucle después de la primera copia exitosa.
- En el segundo fragmento, `break` se ejecuta después de la primera iteración sin tener en cuenta si la copia fue exitosa o no, terminando el bucle prematuramente después de intentar con el primer `path` de la lista.

El primer enfoque es útil cuando quieres detener el proceso tan pronto como tengas éxito en una tarea (por ejemplo, copiar un archivo exitosamente). El segundo enfoque no es típicamente útil en escenarios donde el resultado de una operación dentro del bucle afecta la decisión de continuar o detener el bucle, pues detiene el bucle después de la primera iteración sin condiciones.


#### CONTINUE
El comando `continue` no es exclusivo de los bucles `for`. También puede ser utilizado en bucles `while` y `until` en Bash y otros lenguajes de programación que soportan estas estructuras de control. El propósito sigue siendo el mismo: saltar el resto del código en la iteración actual del bucle y proceder a la próxima iteración.

Aquí te muestro cómo se utiliza `continue` en diferentes tipos de bucles en Bash:

### En un bucle `for`

```bash
for i in {1..5}; do
    if [ $i -eq 3 ]; then
        continue  # Salta la iteración cuando i es igual a 3
    fi
    echo "Número: $i"
done
```

### En un bucle `while`

```bash
i=0
while [ $i -lt 5 ]; do
    i=$((i + 1))
    if [ $i -eq 3 ]; then
        continue  # Salta la iteración cuando i es igual a 3
    fi
    echo "Número: $i"
done
```
asd
### En un bucle `until`

```bash
i=0
until [ $i -ge 5 ]; do
    i=$((i + 1))
    if [ $i -eq 3 ]; then
        continue  # Salta la iteración cuando i es igual a 3
    fi
    echo "Número: $i"
done
```

En todos estos ejemplos, `continue` se utiliza para omitir la ejecución del resto del código en la iteración actual del bucle cuando se cumple una condición específica, y luego continúa con la siguiente iteración del bucle. Esta funcionalidad es fundamental en muchos escenarios de scripting donde necesitas controlar el flujo de ejecución dentro de bucles complejos.