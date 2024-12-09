[[index]]

# YOUTUBE

##### VIDEO
**Maxima calidad: predeterminada**
- Ajuste formato mp4.
```bash
yt-dlp --merge-output-format mp4 {url}
```

**Calidad ajustada**
1. Listado de resoluciones.
```bash
yt-dlp -F {url}
```
2. Agregacion: `id` de resolucion + `bestaudio` para vincularlo con su audio respectivo + ajuste de formato mp4 de ser necesario.
```bash
yt-dlp -f {id}+bestaudio --merge-output-format mp4 {url}
```

##### PLAYLIST
**Maxima calidad: predeterminada**
- Ajuste formato mp4 + `-i` para playlist.
```bash
yt-dlp --merge-output-format mp4 -i {url}
```

**Calidad ajustada**
- Agregacion: `-f` y `height<=480` de resolucion  para delimitar la calidad de video + ajuste de formato mp4 + `-i` para playlist.
```bash
yt-dlp -f "bestvideo[height<=480]+bestaudio/best[height<=480]" --merge-output-format mp4 -i {url}
```


##### AUDIO
**Maxima calidad: predeterminada**
- Agregacion: `-x` para extraer el audio + `--audio-format`seleccionar el tipo de formato de audio.
```bash
yt-dlp -x --audio-format mp3 {url}
```

##### AUDIO PLAYLIST
**Maxima calidad: predeterminada**
- Agregacion: `-x` para extraer el audio + `--audio-format`seleccionar el tipo de formato de audio + `-i` para playlists.
```bash
yt-dlp -x --audio-format mp3 -i {url}
```
# TWITCH

##### VIDEO
**Maxima calidad: predeterminada**
```bash
yt-dlp-aria --merge-output-format mp4 {url}
```

**Calidad ajustado**
1. Uso del `-F`.
```bash
yt-dlp -F {url}
```
2. Uso del `-f`.
```bash
yt-dlp-aria -f {id}+bestaudio --merge-output-format mp4 {url}
```

##### AUDIO


****
