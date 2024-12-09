import random
import time

# Lista de caracteres que quieres generar
characters = '@#$%abcdefghij0123456789klmnopqrstuvwxyz0123456789@#$%0123456789'

# Generador continuo de caracteres
try:
    while True:
        # Selecciona un carácter al azar de la lista
        random_char = random.choice(characters)
        print(random_char, end=' ', flush=True)
        print(' ')
        
        # Pausa entre cada generación (puedes ajustar el tiempo o eliminar la pausa)
        time.sleep(1)
except KeyboardInterrupt:
    print("\nGeneración interrumpida.")
