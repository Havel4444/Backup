[[index]]
[[index_python]]

# DEF

### RETURN
- Si se necesita utilizar el resultado de la función en el código que la llama, se debe utilizar return. Si solo se necesita imprimir el resultado, se puede utilizar print. Sin embargo, en general, es recomendable utilizar return para devolver valores y dejar que el código que llama a la función se encargue de imprimir o utilizar el resultado de manera adecuada.
PRIMER EJEMPLO:
```python
def es_par(numero):
    return numero % 2 == 0

print(es_par(4))  # Imprime True
print(es_par(3))  # Imprime False
```
VENTAJAS:
- La función devuelve un valor que se puede utilizar en el código que la llama. Se puede asignar el resultado de la función a una variable, por ejemplo: resultado = es_par(4). Se puede utilizar la función como parte de una expresión más grande, por ejemplo: if es_par(4): print("Es par").

SEGUNDO EJEMPLO:
```python
def sum(num):
	print(num % 2 == 0)

sum(4)
sum(3)
```
VENTAJAS:
- La función imprime directamente el resultado, lo que puede ser útil para depuración o logging. No se necesita utilizar print explícitamente en el código que llama a la función.
DESVENTAJAS:
- La función no devuelve un valor que se pueda utilizar en el código que la llama. No se puede asignar el resultado de la función a una variable. La función solo imprime el resultado, lo que puede ser confuso si se espera un valor de retorno.

### PARAMETROS
- En una funcion puede ser agrega 1 o varios parametros a los que luego a la hora de llamar la funcion deben ser asignadas.
```python
# Ejemplo principal y escalable.
def sum(x, y)
	return x + y

print(sum(1, 3))

# Ejemplo alternativo y directo.
def sum(x, y)
	print(x + y)

sum(1, 3)
```
















