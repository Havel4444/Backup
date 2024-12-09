[[index]]
[[index_linux]]



# DEBIAN

#### DESCRIPCION
- Mi #Debian data configuracion.

Movimiento en la teminal:
	Descativar la funcion de bloqueo de pantalla para la combinacion de taclas al movimiento en una terminal.
```
gsettings set org.gnome.desktop.screensaver lock-enabled false
```
Si esto no funciona, también puedes intentar desactivar la opción de bloqueo de pantalla a través de la configuración del sistema.
1. Haz clic en el menú de aplicaciones en la esquina superior izquierda de la pantalla.
2. Busca y abre la aplicación “Configuración”.
3. Haz clic en “Privacidad” en la barra lateral izquierda.
4. Desplázate hacia abajo hasta “Bloqueo de pantalla” y haz clic en él.
5. Desactiva la opción “Bloquear” para desactivar la función de bloqueo de pantalla.

Bat:
- El `batcat` superior y mejor que usar `cat`,  acontinuacion como instalarlo.
Paso a paso:
1. inslador en debian.
```sh
sudo apt install bat
```
2. Creacion de las carpetas.
```sh
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```
3. Asignar la carpetas.
```sh
export PATH=$PATH:/usr/local/bin
```
4. Colocar en `.bashrc` para tenerlo de manera permanente.
```sh
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
```


# GIT

#### DEFINICION
- Con #Git es posible guarda y visualizar datos en github.

Comandos principales:
1. git init: Dentro de la carpeta elegida, en el momento se creara una rama fantasma.
2. git commit -m 'f1'.
3. git branch -M main: Elegir como tronco a la rama fantasma. 
4. git remote add origin git\@github.com :Havel4444/asd.git: Vincular github.com con la carpeta local.
5. git push -u origin main: Enviar el contenido de la carpeta local a github.com\/repositorio

0. git branch: Mirar los troncos y el tronco en que estas.
1. git branch -r/-a: Mirar los troncos ocultos.
2. git branch _Tronco_: En caso de querer crear un tronco principal.
3. git branch -d o -D: Eliminar una rama.

1. git log: Commits.
2. git log -p: Ver la diferencia entre los commits.
3. git show asd123: Alternativa a git log -p pero este selecciona a un commit.

3. git checkout _rama01_: Cambiar de rama pero no estaras en ningun tronco. **Modo obserbador**.
4. git checkout _nombreDelNuevoTronco_ asd1234: En caso de querer estar una una rama especifica y tambien estar en un tronco. En este caso **no estas en modo observador** y no que situado.
5. git reset --hard _18df14jl144_: Volver a un commit antiguo borrando los commits creados despues de este mismo. Modo superior.

1. git tag: Muestra las etiquetas secretas.
2. git show _tag_: Comando para ver las etiquetas.

Puerto: 
- Para poder cambiar el puerto predeterminado de un git clone es agregando el puerto despues del servidor/localhost.
```bash
ssh://bandit31-git@localhost:2220/home/bandit31-git/repo
```


##### ELIMINAR COMMITS
- Para eliminar commits en Git, que es el sistema de control de versiones que probablemente estás utilizando con Kali Linux, puedes utilizar diferentes métodos dependiendo de lo que quieras hacer. Aquí te explico cómo eliminar commits de tu repositorio local y cómo reflejar esos cambios en un repositorio remoto como GitHub.

Eliminar commits localmente
1. **Usar `git reset`**: Esto te permite eliminar commits de tu rama actual. 

   - **Soft Reset**: Mantiene tus cambios en el área de staging (index).
     ```bash
     git reset --soft HEAD~1
     ```
   - **Mixed Reset** (por defecto): Mantiene tus cambios pero los saca del área de staging.
     ```bash
     git reset --mixed HEAD~1
     ```
   - **Hard Reset**: Elimina los cambios completamente.
     ```bash
     git reset --hard HEAD~1
     ```

   Aquí, `HEAD~1` significa "el commit antes del último". Puedes cambiar el número `1` por cualquier número para retroceder más commits.

2. **Usar `git revert`**: Crea un nuevo commit que deshace los cambios introducidos por commits anteriores sin eliminar el historial.
   ```bash
   git revert [commit_hash]
   ```
   Reemplaza `[commit_hash]` con el hash del commit que deseas revertir.

Sincronizar los cambios con GitHub
- Después de eliminar los commits de tu repositorio local, necesitas sincronizar o actualizar tu repositorio en GitHub. Dependiendo de lo que hayas hecho, tienes diferentes opciones:

- **Si usaste `git reset`**: Necesitarás forzar el push para sobrescribir la historia en el repositorio remoto. **Ten cuidado**, ya que esto puede afectar a otros colaboradores del repositorio.
  ```bash
  git push origin [branch_name] --force
  ```

- **Si usaste `git revert`**: Simplemente haces un push de los cambios como lo harías normalmente, ya que solo estás añadiendo un nuevo commit.
  ```bash
  git push origin [branch_name]
  ```


# NEOVIM
### DESCRIPCION
- #Nvim version mejorada de vim.

### INSTALACION
1. Instala las dependencias necesarias para compilar Neovim:
```bash
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
```
2. Clona el repositorio de Neovim desde GitHub:
```bash
git clone https://github.com/neovim/neovim.git
```
3. Entra al directorio del repositorio de Neovim:
```bash
cd neovim
```
4. Compila e instala Neovim:
```bash
make CMAKE_BUILD_TYPE=Release
sudo make install
```

### CONFIGURACION
- Si obtienes el mensaje "No such file or directory" al intentar ejecutar `nvim --version`, parece que Neovim no se ha instalado correctamente en tu sistema o no se ha agregado al PATH. Esto podría deberse a un problema durante el proceso de compilación o instalación.
- Para solucionar esto, primero intentemos verificar si Neovim se instaló correctamente y está presente en el directorio de instalación. Puedes hacerlo listando el contenido del directorio `/usr/local/bin/`, que es donde suele instalarse Neovim después de compilarlo e instalarlo manualmente. Ejecuta el siguiente comando para verificar si Neovim está presente:
```bash
ls /usr/local/bin/nvim
```
- Si ves el archivo `nvim` en la lista de salida, significa que Neovim se instaló correctamente en tu sistema. En ese caso, podemos solucionar el problema agregando `/usr/local/bin/` al PATH de tu sistema. Puedes hacerlo agregando la siguiente línea al final de tu archivo `.bashrc` o `.bash_profile`:
```bash
export PATH="/usr/local/bin:$PATH"
```

### ARCHIVO
- Para configurar Neovim con las opciones que has proporcionado, puedes crear o editar el archivo de configuración `init.vim` (o `init.lua` si estás utilizando la configuración en Lua) en el directorio `~/.config/nvim/`. Aquí tienes los pasos para hacerlo:
1. Abre o crea el archivo de configuración `init.vim`:
```bash
nvim ~/.config/nvim/init.vim
```
2. Copia y pega las opciones de configuración que has proporcionado en el archivo `init.vim`.
- Tu archivo `init.vim` podría verse así:
```vim
" Habilitar resaltado de sintaxis
syntax on

" Establecer el tamaño de la tabulación
set tabstop=4

" Habilitar la detección de tipo de archivo
filetype on

" Mostrar la regla en la parte inferior
set ruler

" Comando para copiar al portapapeles
command Cp :'<,'>w !xclip -selection clipboard

" Habilitar la visualización de caracteres especiales
set list

" Mostrar números de línea
set nu

" Mostrar números relativos
set relativenumber

" Deshabilitar la regla
set noruler

" Deshabilitar la visualización de caracteres especiales
set nolist

" Establecer el portapapeles como unnamedplus (para copiar al portapapeles)
set clipboard=unnamedplus

" Establecer el esquema de colores
colorscheme desert
```
3. Guarda el archivo y ciérralo.



# VIM

#### DESCRIPCION
- #Vim tiene archivos de configuracion tanto para el usuario normal como para root.

Configuracion vim-root:
- Archivo padre de _.vimrc_, Ubicado en /usr/share/vim/vimrc.
```sh
syntax on
set tabstop=4
filetype on
set ruler
set list
```




# INSTALL

##### DESCRIPCION
- #Instalar los siguientes programas en debian.

Translate:
```sh
sudo apt install translate-shell -y
```

Zoxide:
1. instalar git.
```sh
sudo apt install curl git
```
2. Descargar la zoxide.
```sh
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | bash
```
3. Instalar fzf y z, se configuran automaticamente en .bashrc
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
4. Ejecutar source.
```sh
source ~/.bashrc
```


#### ENTORNO
- El #Entorno donde se instalaran themas y se configuraran archivos.

Background:
-  El cambio de un #FondoDePantalla en linux tiene que ver principalmente con el gesto de ventas que en el caso de debian es Mate, asi que primero se tiene que averiguar este mismo.
Paso a paso:
1. Descarga desde web.
```
wget http://urlimagen.png
```
2. Instalar Gsettings.
```
sudo apt-get install gsettings-desktop-schemas
```
3. Cambiar el fondo.
```
gsettings set org.mate.background picture-filename '/home/havel/Pictures/
```

Tema entorno:
- Los Temas de en este caso Debian 11 con gestor de ventanas MATE y un GNOME2 puedes ser descargados de la siguiente pagina.
```
https://www.mate-look.org/browse?cat=135&ord=rating
```
Instalacion:
1. Descargar y descomprimir el archivo
2. Copiar y pegar en la siguiente ruta.
```sh
# Ruta del tema
cd /usr/share/themes/
# Ruta del icono
cd /usr/share/icons/

# Comando para copiar y pegar en la ruta themes
sudo cp -r ~/downloads/tema ./
```

Tema entorno del inicio:
- Configuracion e instalacion de Grub.
```sh
# Ubicacion 1
/usr/share/grub/themes
# Ubicacion 2
/boot/grub/themes/

# pagina de instalacion
https://github.com/vinceliuice/grub2-themes

sudo ./uninstall.sh
sudo rm -rf grub2-themes
```

Redshift:
```sh
sudo apt install redshift
```


#### TEMA DE KITTY Y BASH
- Instalar #OhMyBash y juntarlo con #KyttyTheme mas zoxide principalmente mejora en su totalidad el aspecto y las funciones de `ZOXIDE`.

Kitty themes:
- El siguiente link explica como cambiar el especto de la terminal kitty. Theme elejido: Brogrammer. Eliminar el archivo _theme.conf_ para cambiar a otro tema y ejecutar el siguiete comando con el tema elegido.
```sh
# Tema elegido Earthsong.
https://github.com/dexpota/kitty-themes

# Comando a ejecutar en la carpeta kitty
ln -s ./kitty-themes/themes/TEMA.conf ~/.config/kitty/theme.conf
```

Oh my bash:
- En el siguiente video explicara como instalar oh my bash, esto solo cambiara lo relacionado a la `FUENTE`. `GUARDAR LA CONFIGURACION .BASHRC` porque sera borrado luego de instalar esto.
```sh
https://www.youtube.com/watch?v=qi5Vzw5AU9M&ab_channel=ContandoBits

# Pagina de temas
# Theme elegido: Tema elegido mairan.
https://github.com/ohmybash/oh-my-bash/wiki/Themes
```




# KYBOARD SHORTCUT

#### DESCRIPCION
- Configuracion mediante #KeyboardShortcuts.

Ventana:
- Cambio del movimiento de ventana `MOD4+LEFT` y `MOD4+RIGHT`. 
```sh
# Mover ventana a la izquierda.
Tile window to east(right) side of screen = Mod4+,
# Mover ventana a la derecha.
Tile window to west(left) side of screen = Mod4+.
```

Escritorio:
1. Mover las ventanas entre los workspaces 1,2,3 o 4.
```sh
Move window to workspace 1 = Alt+Mod4+H
Move window to workspace 2 = Alt+Mod4+J
Move window to workspace 3 = Alt+Mod4+K
Move window to workspace 4 = Alt+Mod4+L
```
2. Moverte entre workspaces.
```sh
Switch to workspace 1 = Shift+Alt+!
Switch to workspace 2 = Shift+Alt+@
Switch to workspace 3 = Shift+Alt+#
Switch to workspace 4 = Shift+Alt+$
```

Sonido:
- Subir,bajar,mutear y pausar.
```sh
Volume up = Shift+Ctrl+I
Volume down = Shift+Ctrl+U
Volume mute = Shift+Ctrl+O
Volume play = Shift+Ctrl+Y
```




# ETHERNET

#### DESCRIPCION
- #Ethernet configuracion.

Error de conexion:
- La conexion de internet me diante clable al router en parrot trae, en algunos cosos, un error en la configuracion de #ControladoreDeRed, para solucionarlos en `PARROT SECURITY OS` con `DEBIAN 11` estan estos siguientes pasos:
1. Verificar si el controlador esta cargado.
```
# Modo automatico
lsmod | grep r8169
# Modo manual
sudo modprobe r8169
```
2. Revisar la configuracion de red. Confirma que la configuracion de red en el archivo "/etc/network/interfaces" sea correcta para tu tarjeta. Podria verse algo asi:
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
```
3. Guarga los cambios.
```
# Aveces no funciona
sudo /etc/init.d/networking restart
```
4. Reinicia el NetworkManager.
```
sudo systemctl restart NetworkManager
```
5. En caso de seguir el error agregar el modulo 'modprobe r8169' al archivo '/etc/modules' en `MODO ROOT` al final.
```
r816
```
6. Actualizar la configuracion de #Kernel.
```
sudo update-initramfs -u
```




# ALIAS

#### DESCRIPCION
- #Alias encontrados en `.bashrc`.

Bashrc:
- El #Bashrc es un archivo que no aparece junto a la instalacion de linux, una de sus funciones es `crear alias` y su comando de creacion es el siguiente:
```
touch .bashrc
```

Funsion shell en bashrc:
- El uso del #AliasConComandos redirigir la salida de error estándar a un archivo, es mejor utilizar una función de shell en lugar de un alias. Puedes agregar la siguiente función a tu archivo .bashrc:
```sh
# En este ejemplo, reemplaza "comando_a_ejecutar" con el comando real que deseas ejecutar. Luego, cuando ejecutes iner, se ejecutará el comando especificado y cualquier mensaje de error se redirigirá al archivo "error.txt" en el escritorio.
ALIAS() {
    comando_a_ejecutar "$@" 2> /home/havel/Desktop/error.txt
}

# Ejemplo 2
cphi2() {
	grep -v '^#' .bash_history "$@" > ~/.bash_history_filtered | less .bash_history_filtered | fzf --tac | xclip -selection clipboard
}
```




# DESCOMPRECION

Comandos para instalar y #descomprimir. 
**.deb:**
```
# Instalador
sudo dpkg -i nombre-del-archivo.deb
sudo dpkg -i

# Error por falta de dependencias
sudo apt-get install -f
```

**tar.xz:**
```
	tar -xJvf nombre-del-archivo.tar.xz
tar -xJvf 
```

**7z:**
```
# Instalador
sudo apt-get install p7zip-full

# Descompresor
7z x archivo.7z
7z x 
```


# YOUTUBE

#### DESCRIPCION
- #Surfingkeys 

Comandos en modo avanzado:
```sh
api.unmap('j');
api.unmap('k');
api.unmap('l');
api.unmap('i');
api.unmap('t');
api.unmap('f');
api.unmap('h');
api.unmap('1');
api.unmap('2');
api.unmap('3');
api.unmap('4');
api.unmap('5');
api.unmap('6');
api.unmap('7');
api.unmap('8');
api.unmap('9');
api.unmap('0');
```



# ENTER UNIVERSAL

**DEFINICION:**
- #CtrlJ es la combinacion de teclas para ejecutar enter, en todo el sistema.

Paso a paso version 1:
1. Puedes usar `xdotool` directamente en lugar de `xbindkeys` para manejar la combinación de teclas "Ctrl + J". Primero, asegurémonos de que `xdotool` esté instalado:
```bash
sudo apt-get install xdotool
```
2. Luego, crea un script Bash, por ejemplo, `simulate_ctrl_j_enter.sh`:
```bash
# METODO 1
#!/bin/bash

# Espera un breve momento para liberar las teclas si se presionaron rápidamente
sleep 0.2

# Utiliza xdotool para simular la pulsación de "Enter"
xdotool key Return

--------------------------------------------
# METODO 2
#!/bin/bash
# Liberar Ctrl
xdotool keyup Control

# Espera un breve momento
sleep 0.1

# Enviar Enter
xdotool key Return

# Espera otro breve momento antes de reactivar Ctrl, si es necesario
sleep 0.1

# Reactivar Ctrl
xdotool keydown Control
```
3. Guarda el script y dale permisos de ejecución:
```bash
chmod +x simulate_ctrl_j_enter.sh
```
4. Ahora, configura tu sistema para que ejecute este script cuando presiones "Ctrl + J". Puedes hacer esto utilizando `xbindkeys`. Crea un archivo de configuración, por ejemplo, `~/.xbindkeysrc`:
```bash
nano ~/.xbindkeysrc
```
5. Agrega la siguiente línea:
```bash
"ruta_completa_del_script/simulate_ctrl_j_enter.sh"
  Control + j
```
6. Reemplaza "ruta_completa_del_script" con la ubicación real del script que acabas de crear. Guarda el archivo y reinicia `xbindkeys`:
```bash
# METODO 1
killall xbindkeys
xbindkeys
-----------------
# METODO 2
pkill xbindkeys
xbindkeys
```
7. Ahora, cuando presiones "Ctrl + J", debería ejecutarse el script y simular la pulsación de "Enter". Asegúrate de que no haya otras configuraciones de teclas conflictivas en tu sistema.


Paso a paso version 2:
1. Creamos un script adicional llamado `setup_xdotool_behave.sh`:
```bash
#!/bin/bash

# Configura xdotool behave para que ejecute el script cuando se presione "Ctrl + J"
xdotool behave_screen_edge key ctrl+j exec /ruta/completa/del/script/simulate_ctrl_j_enter.sh
```
2. Crea un nuevo script llamado `simulate_ctrl_j_enter.sh` con el siguiente contenido:
```bash
#!/bin/bash

# Obtén el identificador de la ventana activa
window_id=$(xdotool getactivewindow)

# Utiliza xdotool para simular la pulsación de "Ctrl + J" y luego "Enter"
xdotool key --clearmodifiers --window $window_id ctrl+j Return
```
3. Dale permisos de ejecución a ambos scripts:
```bash
chmod +x simulate_ctrl_j_enter.sh
chmod +x setup_xdotool_behave.sh
```
4. Luego, ejecuta esto directamente en la terminal para configurar la acción:
```bash
xdotool behave $(xdotool getactivewindow) key ctrl+j exec /ruta/completa/del/script/simulate_ctrl_j_enter.sh
```
5. Este enfoque utiliza `xdotool getactivewindow` para obtener el identificador de la ventana activa y luego simula la pulsación de "Ctrl + J" seguido por "Enter". Espero que esto resuelva el problema de repetición no deseada.



# INTERFAS GRUB

#### DEFINICION
- #Grub.
 
Paso a paso:
- Para solucionar esto y poder ver todas las distrubiciones, puedes intentar habilitar `os-prober` y ejecutar nuevamente `update-grub`. Aquí están los pasos que puedes seguir:
1. Abre el archivo de configuración de GRUB en un editor de texto. Puedes usar `nano` u otro editor de tu elección:
   ```bash
   sudo vim /etc/default/grub
   ```
2. Busca la línea que comienza con `GRUB_DISABLE_OS_PROBER` y asegúrate de que esté establecida en `false`. Si la línea no existe, agrégala al archivo y establece su valor en `false`.
   ```bash
   GRUB_DISABLE_OS_PROBER=false
   ```
3. Guarda los cambios y cierra el editor de texto.
4. Ahora, ejecuta nuevamente `sudo update-grub`:
   ```bash
   sudo update-grub
   ```
- Esto debería permitir que `os-prober` busque otros sistemas operativos instalados en tu sistema, incluido Windows, y los agregue al menú GRUB. Después de realizar estos pasos, reinicia tu computadora y verifica si ahora ves la opción para iniciar Windows en el menú GRUB.

# MONTAR

###### Instalar ntfs-3g (si no está ya instalado)
sudo apt update
sudo apt install ntfs-3g
###### Crear un punto de montaje
sudo mkdir /mnt/sdb2
###### Montar la partición usando ntfs-3g
sudo mount -t ntfs-3g /dev/sdb2 /mnt/sdb2
###### Acceder al contenido de la partición
cd /mnt/sdb2
ls
###### Desmontar la partición cuando termines
sudo umount /mnt/sdb2



# LINKS
Comandos basicos de linux:
https://www.fing.edu.uy/inco/cursos/sistoper/recursosLaboratorio/tutorial0.pdf
