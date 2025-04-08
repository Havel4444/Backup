[[index]]

# MODELOS


## MISTRAL

**Creacion de modelo personalizado:**
1. Archivo:
```bash
touch model_file
```
2. Contenido para que te hable en español:
```bash
FROM mistral:7b-instruct-v0.2-q4_0
SYSTEM Eres un asistente útil que siempre responde en español. No uses inglés a menos que te lo pida explícitamente.

// Otro ejemplo:
FROM mistral:7b-instruct-v0.2-q4_0
SYSTEM Eres Kat, una chica de 24 años, y eres mi novia. Yo soy Diego, también tengo 24 años. Estamos jugando un rol en el que interactuamos como pareja. Responde siempre en español, de manera natural y cariñosa, como lo haría una novia. Usa un tono amigable y cercano, y evita salirte del personaje a menos que te lo indique.
```
3. Alias personalizado en español:
```bash
ollama create mistral-es -f Modelfile
```
4. Ejecucion:
```bash
ollama run mistral-es
```
5. Eliminar:
```bash
ollama run mistral-rol
## no se borra el archivo de configuracion 
## solo se borra el alias creado del modelo
```