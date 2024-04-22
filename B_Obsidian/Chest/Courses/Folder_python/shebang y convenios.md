[[index]]
[[index_python]]
# SHEBANG
Modulo:
- Los modulos conocidos como scripts pueden tener un arbol de jerarquia mediante una condicional `if`.
- A) Modulo principal. 
```python
	# file_name: caja.py
	if __name__ = '__main__':
		print("Modulo principal")
	else:
		print("Modulo secundario")
```
 - B) Modulo secundario.
```python
	# file_name: objeto.py
	import caja
```
- En caso de ejecutar `python3 caja.py` la terminal reenviara "Modulo principal", pero en caso contrario si se ejecuta `python3 objeto.py` la terminal reenviara "Modulo secundario".




# CONVENIOS
Tipos:
- Los términos **lowercase**, **uppercase**, y **snake_case** se refieren a diferentes convenciones de nomenclatura utilizadas para escribir nombres de identificadores como variables, funciones y clases. A continuación, te describo cada uno de estos estilos:
1. **LowerCamelCase (minúsculas)**:
   - Ejemplo: `variableArbol`.
2. **UpperCamelCase (mayúsculas)**:
   - Ejemplo: `VariableArbol`.
3. **snake_case**:
   - Ejemplo: `variable_arbol`

