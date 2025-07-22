[[index]]
[[key_bash]]


## 1. **NÚMERO ENTERO (solo positivo)**

### a) *Cualquier número entero positivo*

```bash
if [[ "$valor" =~ ^[0-9]+$ ]]; then
  echo "Es un número entero positivo."
fi
```

---

### b) *Número entero positivo en un rango específico (por ejemplo, del 1 al 3)*

```bash
if [[ "$valor" =~ ^[1-3]$ ]]; then
  echo "Es un número entero entre 1 y 3."
fi
```

🔹 Para rangos más grandes (ej: entre 10 y 20):

```bash
if [[ "$valor" =~ ^[0-9]+$ ]] && (( valor >= 10 && valor <= 20 )); then
  echo "Es un número entero entre 10 y 20."
fi
```

---

## ✅ 2. **NÚMERO DECIMAL (positivo)**

### a) *Cualquier número decimal positivo*

```bash
if [[ "$valor" =~ ^[0-9]+\.[0-9]+$ ]]; then
  echo "Es un número decimal positivo."
fi
```

---

### b) *Número decimal positivo en un rango (ejemplo: entre 0.5 y 2.5)*

```bash
if [[ "$valor" =~ ^[0-9]+\.[0-9]+$ ]] && (( $(echo "$valor >= 0.5 && $valor <= 2.5" | bc -l) )); then
  echo "Es un número decimal entre 0.5 y 2.5."
fi
```

---

## ✅ 3. **NÚMERO (entero o decimal, solo positivo)**

### a) *Cualquier número positivo (entero o decimal)*

```bash
if [[ "$valor" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Es un número válido (entero o decimal positivo)."
fi
```

---

### b) *Número positivo (entero o decimal) en un rango (ejemplo: de 1 a 10.5)*

```bash
if [[ "$valor" =~ ^[0-9]+(\.[0-9]+)?$ ]] && (( $(echo "$valor >= 1 && $valor <= 10.5" | bc -l) )); then
  echo "Está en el rango permitido."
fi
```

---