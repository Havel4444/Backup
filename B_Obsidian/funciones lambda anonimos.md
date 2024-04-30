[[index]]
[[index_python]]

# LAMBDA

#### FUNCION
- En caso de querer crear un funcion `def` el cual solo requiera de pocas lineas de codigo, la forma mas adecuada de hacerlo en dicha forma es usando un funcion `lambda`.
```python
# MAL: funcion def.
def cuadrado(x):
	return x**2
print(cuadrado(4))

# BIEN: funcion lambda.
cuadrado = lambda x: x**2
print(cuadrado())
``` 

### MAP + LAMBDA
- En caso de querer saber el cuadrada de cada elemento de una lista la funcion `map` + `lambda` tiene que ser usado insertando 2 parametros, el primero es el codigo a ejecutar y el segundo el iterable(Algo como una lista). En caso de querer hacerlo en una solo linea se debe de colocar antes `list`.
```python
numeros = [1, 2, 3, 4]
cuadrados = list(map(lambda x: x**2, numeros))

print(cuadrados)
```








