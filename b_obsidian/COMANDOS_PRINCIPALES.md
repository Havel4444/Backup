[[index]]
[[key_bash]]

# COMANDOS II


## EXTRAS

**Documentacion:**
- Motrar la libreria del comando.
```bash
man ls
```
**Ubicacion:**
- Volver a la ultima ubicacion.
```bash
cd -
```


## BUSQUEDA

**Listado:**
- Mostrar el peso del archivo + ordenamiento.
```bash
ls -lsh

// Orden por peso.
ls -lh -S
// Orden por peso al revez.
ls -lh -Sr
```

- Mostrar el peso del directorio __sin__ subdirectorios + ordenamiento. 
```bash
du -sh ~/Vídeos
du -sh *

// Orden por peso.
du -sh * | sort -h

// Orden por peso al revez.
du -sh * | sort -hr
```

- Mostrar el peso del directorio __con__ subdirectorios + ordenamiento.
```bash
du -h ~/Vídeos
du -h *

// Orden por peso.
du -h * | sort -h

// Orden por peso al revez.
du -h * | sort -hr
```

- Mostrar por fecha de creacion.
```bash
ls -lt

// Alarevez
ls -ltr
```

- Busqueda recursiva: Muestra detalladamente los sub-directorios.
```bash
ls -lR
```


## ORDENAMIENTO



## CREACION, MODIFICACION Y ELIMINACION














