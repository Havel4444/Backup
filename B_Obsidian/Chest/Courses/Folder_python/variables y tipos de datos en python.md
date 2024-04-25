[[index]]
[[index_python]]

# VARIABLES

##### Variables:
- Una variable en Python es un nombre que se utiliza para hacer referencia a un valor en la memoria. Las variables se utilizan para almacenar y manipular datos en un programa Python.
- Ejemplo:
```python
x = 10  # x es una variable que contiene el valor entero 10
nombre = "Juan"  # nombre es una variable que contiene una cadena de texto
```




# TIPOS DE DATOS
##### Tipos de datos:
- Los tipos de datos en Python definen qué tipo de valores pueden tener las variables y cómo se pueden manipular esos valores.
- Algunos tipos de datos básicos en Python incluyen enteros (`int`), flotantes (`float`), cadenas de texto (`str`), booleanos (`bool`), listas (`list`), tuplas (`tuple`), diccionarios (`dict`), conjuntos (`set`), entre otros.
- Ejemplo:
```python
x = 10  # x es una variable de tipo entero
y = 3.14  # y es una variable de tipo flotante
nombre = "Juan"  # nombre es una variable de tipo cadena de texto
es_verdadero = True  # es_verdadero es una variable de tipo booleano
mi_lista = [1, 2, 3, 4]  # mi_lista es una variable de tipo lista
mi_diccionario = {"nombre": "Juan", "edad": 30}  # mi_diccionario es una variable de tipo diccionario
```




# SCRIPT
##### Temas que se veran
- En esta clase se vieron los temas: 
1. Listas y sus comandos. Suma, resta y promedio.
2. Bucle for  y 1 funcion.

```python
#!/usr/bin/env python3 
mi_lista = []

# Agregar solo 1 elemento a una lista.
mi_lista.append(1)
mi_lista.append(2)
mi_lista.append(3)
mi_lista.append(6)
mi_lista.append(6)
mi_lista.append(6)
mi_lista.append(5)
mi_lista.append(4)

# Agregar varios elementos a una lista.
mi_lista += [7, 8, 9]

# Ordenar la lista.
mi_lista = sorted(mi_lista)

# Eliminar el elemento de una lista con el indice 0.
del mi_lista[0]
# Eliminar el ultimo elemento.
mi_lista.pop()

# Inserta en un indice el elemento de una lista
mi_lista.insert(9, 999999)

# Mostrar cada elemento de una lista con un bucle for.
for lista in mi_lista:
    print(f"Elemento: {lista}")

# Mostrar el indice y el elemento mediante una condicional for.
for x, y in enumerate(mi_lista):
    print(f"Indice: {x}; Elemento: {y}")

# Cual es el indice del elemento de una lista
print(f"Indice del elemento 4 es: {mi_lista.index(4)}")
# Que elemento hay en un indice de una lista.
print(f"Elemento del indice 1 es: {mi_lista[1]}")
# Contar los elementos repetidos de una lista
print(f"Cantidad de veces que se repite el elemento 6: {mi_lista.count(6)}")
# Quitar los elemento repetidos de una lista.
print(f"Eliminacion de elementos repetidos: {set(mi_lista)}")
# El numero mas alto de una lista.
print(f"El numero mas alto es: {max(mi_lista)}")
# El numero mas bajo de una lista. 
print(f"El numero mas bajo es: {min(mi_lista)}")
# Promedio de una lista.
print(f"Promedio: {sum(mi_lista) / len(mi_lista)}")
# Promedio redondeado con solo 2 digitos de una lista.
print(f"Promedio redondeado de 7: {round( 22 / 7, 2)}")
```
