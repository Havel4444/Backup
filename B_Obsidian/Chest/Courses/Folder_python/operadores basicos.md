[[index]]
[[index_python]]

# OPERADORES
### CUENTAS:
- Agregacion de comas, remplazo de la misma y operaciones con numeros/letras.

NUMEROS:
- Multiplicacion de numeros enteros.
```python
num1 = 3 
num2 = 13
result = num1 ** num2
print(result)
``` 
FORMAT:
- Agregar comas con `format`.
```python
num1 = 3 
num2 = 13
result = num1 ** num2
print("{:,}".format(result))
``` 
- Cambiar las comas con `replace`.
```python
num1 = 3 
num2 = 13
result = num1 ** num2
print("{:,}".format(result).replace(",", "."))
```

STRINGS:
- Multiplicacion de strings.
```python
var1 = "piano"
print(var1[0:2] * 3)
``` 

SUMA DE LISTAS
- Sumatoria de valores con un mismo indice.
```python
numeros_impares = [1, 3, 5, 7, 9]
numeros_pares = [2, 4, 6, 8, 10]

union = zip(numeros_impares, numeros_pares)
for elemento in union:
    print(sum(elemento))
``` 




# SCRIPT

```python 
#!/usr/bin/env python3

num1 = 12
num2 = 6 
result = num1 ** num2
# Formateo de variable.
# Agregar comas para que el resultado sea legible.
print("{:,}".format(result))
# Cambiar las comas por puntos.
print("{:,}".format(result).replace(",", "."))

print("")

# Operaciones con variables
var1 = "Pato" 
var2 = "Baca"

# Multiplicacion de 1 o varios caracteres.
print(var1 * 3)
print(var1[0] * 3)
print(var1[0:3] * 3)

print("")

# Operaciones con listas
numeros_impares = [1, 3, 5, 7, 9]
numeros_pares = [2, 4, 6, 8, 10]

# Metodo 1: suma de listas por indices iguales.
union = map(sum, zip(numeros_impares, numeros_pares))
for elemento in union:
    print(elemento)

print("")

# Metodo 2: suma de listas por indices iguales.
union = zip(numeros_impares, numeros_pares)
for elemento in union:
    print(sum(elemento))

print("")

# Metodo 3: suma de listas por indices iguales y finalizar como una lista.
# transformar un codigo for a variable simple con "list".
union = list(map(sum, zip(numeros_impares, numeros_pares)))
print(union)

```