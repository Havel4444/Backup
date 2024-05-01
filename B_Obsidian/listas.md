[[index]]
[[index_python]]

# LISTA
#Lista
### ¿QUE ES? 
- Una lista (en Python) es una colección ordenada de elementos que pueden ser de cualquier tipo (números, cadenas, objetos, etc.), separados por comas y encerrados entre corchetes []. Por ejemplo: [1, 2, 3, 4, 5] o ["hola", "mundo", "python"]. 

### METODOS, FUNCIONES Y OPERACIONES

APPEND:
-  Append es un metodo que te permite agregar un nuevo elemento al final de una lista, como si estuvieras agregando un nuevo juguete a la caja de juguetes.
```python
mi_lista = [1, 2, 3]
mi_lista.append(4)
``` 
MAS IGUAL:
- La operacion mi_lista `+=` [4, 5, 6] es una forma de agregar varios elementos a una lista existente. Es como tomar una lista de elementos y concatenarla con una nueva lista que contiene los elementos 4, 5 y 6. 
```python
mi_lista = [1, 2, 3]
mi_lista += [4, 5, 6]
```
SORTED/SORT:
- Sorted() es una función built-in de Python que devuelve una nueva lista ordenada.
- Sort() es un método de lista que ordena la lista original en lugar.
```python
sorted(mi_lista)
mi_lista.sort()
```
DEL:
- Del es un statement de Python que se utiliza para eliminar objetos o elementos de una lista por su indice.
```python
del mi_lista[0]
```
POP:
- Pop() es un método de lista que elimina por su indice y devuelve un elemento de la lista. En caso de no colocar nada elimina el ultimo indice.
```python
mi_lista.pop()
```
REMOVE:
- Remove() es un método de lista que elimina el primer elemento que coincide con el valor especificado en la lista.
```python
mi_lista.remove('pato')
```
INSERT:
- insert() es un método de lista que agrega un elemento en una posición específica de la lista.
```python
mi_lista.insert(0, 'arbol')
```
LEN:
- len() es una función built-in de Python que devuelve la longitud de una lista (es decir, el número de elementos que contiene).
```python
mi_lista = ["pato", "hormiga", "gato"]
total = len(mi_lista) #= 3
```
INDEX:
- index() es un método de lista que devuelve el índice del primer elemento que coincide con el valor especificado.
```python
mi_lista = [1, 1, 2, 3]
indice = mi_lista.index(1) #= 0
```
MI_LISTA\[ ]:
- mi_lista[] es la notación para acceder a un elemento de una lista por su índice.
```python
mi_lista = ["pato", "gato", "panda"]
mi_lista[0] #= pato
```
COUNT:
- count() es un método de lista que devuelve el número de veces que aparece un elemento en la lista.
```python
mi_lista = [1, 1, 1, 2, 3]
mi_lista.count(1) #= 3
```
SET:
- set() es una función built-in de Python que devuelve un conjunto (set) a partir de una lista.
```python
mi_lista = [1, 2, 2, 3, 3, 4, 5, 5, 5, 5, 5]
agrupamiento = set(mi_lista) #= {1, 2, 3, 4, 5}
```
SUM:
- sum() es una función built-in de Python que devuelve la suma de todos los elementos de una lista.
```python
mi_lista = [1, 2, 3, 4, 5]
print(sum(mi_lista))  # 15
```
MIN:
- min() es una función built-in de Python que devuelve el elemento más pequeño de una lista.
```python
mi_lista = [1, 2, 3, 4, 5]
print(min(mi_lista))  # 1
```

MAX:
- max() es una función built-in de Python que devuelve el elemento más grande de una lista.
```python
mi_lista = [1, 2, 3, 4, 5]
print(max(mi_lista))  # 5
```
REVERSE:
- reverse() es un método de lista que invierte el orden de los elementos de la lista. 
- Nota que también existe una función reversed() que devuelve un iterador que itera sobre la lista en orden inverso, pero no modifica la lista original.
```python
mi_lista = [1, 2, 3, 4, 5]
mi_lista.reverse()
print(mi_lista)  # [5, 4, 3, 2, 1]
```




# SCRIPT
### SIN