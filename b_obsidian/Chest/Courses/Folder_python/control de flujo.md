[[index]]
[[index_python]]

# SCRIPT

```python
#!/usr/bin/env python3
## 1.Bucle while: Termina cuando "i" sea mayor que 5.
def p1():
    i = 0
    while i < 5:
        print(i)
        i += 1

## 2.Bucle for: Aplicando "for" en una lista de nombres. 
def p2():
    names = ["Andres", "Pedro", "Juan"]
    for name in names:
        print(name)

## 3.Bucle for: Mostrar el indice y los elementos de la lista.
def p3():
    casas = ["pequeña", "mediana", "grande"]
    for x, y in enumerate(casas):
        print(f"Slot [{x+1}]: {y}")

## 4.Bucle for: Aplicando "for" en un diccionarios. 
def p4():
    fruits = {"Manzana": 1, "Pera": 9}
    for fruit, amount in fruits.items():
        print(f"Fruta: {fruit}; Cantidad: {amount}") 

## 5.Bucle for: Aplicando "for" en una listas dentro de otra lista.
def p5():
    my_list = [[1, 2, 3], [4, 5, 6]]
    for list_1 in my_list:
        for list_2 in list_1:
            print(list_2)

## 6.Bucle for: Aplicando potencias a los elementos de una lista.
def p6():
    list_num = [2, 4, 5]
    cuad = [i ** 2 for i in list_num]
    print(cuad)

## 7.Condicional for and if: uso de "<=;>=;==;!=", "and", "or", "break", "continue", "pass" y "else" en un "for".
def p7():
    for id in range(8):
        id += 1
        if id == 4 and id == 4 or id == 4:
            print(f"Saltando el {id}.")
            continue
        elif id >= 12:
            print(f"Saliendo del bucle en el numero {id}")
            break
        print(id)
    else:
        print("Bucle finalizado.")

## 8.Condicional if: Aplicando if en una lista
def p8():
    list_if = [1, 3, 4, 5]
    if 1 in list_if:
        print("El numero 1 esta en la lista.")

## 9. Condicional if: Operador terniario. Operacion en una linea. 
def p9():
    age = 44 
    ask = "Eres mayor de edad" if age >= 18 else "Eres menor de edad"
    print(ask)
```