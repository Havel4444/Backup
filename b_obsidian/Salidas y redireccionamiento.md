[[index]]
[[index_linux]]

# SALIDA
#Salidas
#### STDIN
**0**:
- Comando entrante sin ejecutar.
```bash
# Entrada
ls 

# Ruta
/dev/stdin
```

#### STDOUT
**1**:
- Comando de salida, ejecutado.
```bash
# Salida 
/Descargas
/Escritorio
/Etc...

# Ruta
/dev/stdout
```

#### STDERR
**2**:
- Comando de salida de error.
```bash
# Comando erroneo previo
ls -3

# Salida erronea
ls: opción inválida -- '3'
Pruebe 'ls --help' para más información.

# Rutas 
/dev/stderr
/dev/null
```



# REDIRECIONAMIENTO

#Redireccionamiento
##### SALIDAS MULTIPLES
- Agrega tanto la salida estandar como la error.

**Sin sobre-escritura**:
```bash
# Ejem 1
ls >> texto.txt 2>&1

# Ejem 2
find / -type f -name *.lua >> nada 2>&1
```

**Con sobre-escritura**:
```bash
# Ejem 1
ls > texto.txt 2>&1

# Ejem 2
find / -type f -name *.lua > nada 2>&1
```
