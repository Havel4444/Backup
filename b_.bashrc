# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# alias[aly].
alias p3="python3"
alias menu="/home/havel/Data/Scripts/./menu.sh"
alias nodu="awk '!x[\$0]++'"
alias sp="trans -b :es"
alias load='xdg-open'
alias en="trans -b :en"
alias cph1="less .bash_history | fzf --tac | xclip -selection clipboard"

alias er='vim ~/error.txt'
alias cper='cat ~/error.txt | xclip -selection clipboard'

alias sa='vim ~/salida.txt'
alias cpsa='cat ~/salida.txt | xclip -selection clipboard'

alias upda='sudo apt-get update'
alias upgr='sudo apt-get upgrade'
alias pi='ping 8.8.8.8'

## Archivos predeterminados para copiar.
# File: xclip
alias scba='cat /home/havel/xclip/bash_functions | cpou'
alias scpy='cat /home/havel/xclip/python_functions | cpou'

alias cpou='xclip -selection clipboard'

alias cpff='find . -type f | fzf | xclip -selection clipboard'
alias cdfd='cd $(find . -type d | fzf)'

# Momentos
alias cdmo='cd /mnt/storage/Moments'

# Ajedrez
alias ajedrez='cd /home/havel/Games/Ajedrez/logs_games && xboard -fcp gnuchess -size 400x400'

# Pantalla · CREAR UN SCRIPT QUE ME PERMITA DE MANERA INTERACTIVA SUBIR Y BAJAR EL BRILLO + EL FLITRO NARANJA · CREAR UN SCRIPT QUE ME PERMITA DE MANERA INTERACTIVA SUBIR Y BAJAR EL BRILLO + EL FLITRO NARAN
alias fpdi='redshift -O 3600'
alias fpta='redshift -O 3200'
alias fpno='redshift -O 2800'
alias fpre='redshift -x'
alias brdi='xrandr --output HDMI-0 --brightness 0.8'
alias brta='xrandr --output HDMI-0 --brightness 0.6'
alias brno='xrandr --output HDMI-0 --brightness 0.4'

#br() { xrandr --output HDMI-0 --brightness 0.$1; }
#function br() {
#    nivel=$1
#    xrandr --output HDMI-0 --brightness 0.$nivel
#}

# MPV
alias mpv-loop-file='mpv --loop-file=inf'
alias mpv-loop-list='mpv --loop-playlist=inf'
alias mpv-random='mpv --shuffle --loop-playlist=inf'

# DLP
alias dlpv='yt-dlp --merge-output-format mp4'
alias dlpa='yt-dlp -x --audio-format mp3'

# Borrado definitivo
alias rm-d='shred -u -v'

# Conteo de archivos de profundidad 1.
alias wc-l='find . -maxdepth 1 -type f -not -name ".*" | wc -l'

# Cambiar el nombre del ultimo archivo
#alias name='ls -tr | tail -n1 | xargs -I {} mv {}'

# Temp
#alias temp="cd '$(mktemp -d)' && touch borrador.py && nvim borrador.py && echo '#!/usr/bin/env python3' >> borrador.py"
#alias temb="cd '$(mktemp -d)' && touch borrador.sh && nvim borrador.sh && echo '#!/bin/bash' >> borrador.sh"

# PulseAudio
alias puon='pactl load-module module-simple-protocol-tcp rate=44100 format=s16le channels=2 source=auto.slave.monitor record=true port=8000'
alias puof='pactl unload-module module-simple-protocol-tcp'
# Zoxide buscador cd
alias zo="'__fzf_cd__'"
# Fonts
alias fo='kitty list-fonts'
# Python
alias py='python3.9'
# Scrip bash .dotfile git
#alias dogi="~/.dotfiles/./sgit.sh"
# Kitty opacity
alias kiop="~/Desktop/code/./opacity.sh"

# Backup.
alias backup="bash /home/havel/backup/menu_files.sh"
# default.py
alias scpy="cat /home/havel/data/scripts/python/default.py | cpou"

# Multiples hilos de descarga.
alias yt-dlp-aria='yt-dlp --external-downloader aria2c --external-downloader-args "-x 16 -k 1M"'

# Cama.
#alias cama='ffplay rtsp://admin:%21CuaAola08545qa@192.168.1.76/PSIA/Streaming/channels/1'
alias cama='ffmpeg -rtsp_transport tcp -i rtsp://admin:%21CuaAola08545qa@192.168.1.76/PSIA/Streaming/channels/1 \
-rtsp_transport tcp -i rtsp://admin:%21CuaAola08545qa@192.168.1.76/PSIA/Streaming/channels/2 \
-filter_complex "[0:v][1:v]hstack=inputs=2" -f sdl "Cámaras"'

# Cambiar el nombre del ultimo archivo.
alias rename='ls -tr | tail -n1 | xargs -I {} mv {}'

# Predeterminada hdmi.
alias hon='/home/havel/data/scripts/bash/./set-audio-default.sh hdmi'

# Predeterminada bluetooth.
alias bon='/home/havel/data/scripts/bash/./set-audio-default.sh bluetooth'

# Juegos retro.
alias retro='flatpak run org.libretro.RetroArch'

# Mistral-corrector
function cn() {
    name="$2"
    valor="$1"

    letras=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    random=${letras[$RANDOM % ${#letras[@]}]}

    creado1="$(ls -t | head -n1)"
    creado2="$(ls -t | head -n2 | tail -n1)"
    creado3="$(ls -t | head -n3 | tail -n1)"
    creado4="$(ls -t | head -n4 | tail -n1)"

    #if [ -n "$valor" ]; then
    if [ "$valor" -eq 1 ]; then
        mv "$creado1" "${name}_${random}1.png"
    #if [ -z "$valor" ]; then
    #    mv "$creado1" "${name}__${random}1.png"
    elif [ "$valor" -eq 2 ]; then
        mv "$creado1" "${name}__${random}1.png"
        mv "$creado2" "${name}__${random}2.png"
    elif [ "$valor" -eq 3 ]; then
        mv "$creado1" "${name}__${random}1.png"
        mv "$creado2" "${name}__${random}2.png"
        mv "$creado3" "${name}__${random}3.png"
    elif [ "$valor" -eq 4 ]; then
        mv "$creado1" "${name}__${random}1.png"
        mv "$creado2" "${name}__${random}2.png"
        mv "$creado3" "${name}__${random}3.png"
        mv "$creado4" "${name}__${random}4.png"
    fi
}

# Mistral-corrector
function edit() {
    name="$1"

    letras=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    letter=${letras[$RANDOM % ${#letras[@]}]}

    ls -tr | tail -n1 | xargs -I {} mv {} "$1$letter.png"
}

# Mistral-corrector-2
function edit2() {
    name="$1"

    letras=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    letter=${letras[$RANDOM % ${#letras[@]}]}

    ls -tr | tail -n2 | head -n1 | xargs -I {} mv {} "$1$letter.png"
}

# Prueba
function ippr() {
    echo "IP privada: $(hostname -I | awk '{print $1}')"
}
# Prueva 2
function ippu() {
    echo "IP publica: $(curl -s ifconfig.me)"
}

# Copiar funte de colores
function cpco() {
    cat ~/colours | cpou
}
# Eliminar acentos de un archivo.
function seac() {
    file_a=$1
    file_b=$2
    sed 's/á/a/g; s/é/e/g; s/í/i/g; s/ó/o/g; s/ú/u/g; s/ü/u/g; s/Á/A/g; s/É/E/g; s/Í/I/g; s/Ó/O/g; s/Ú/U/g; s/Ü/U/g' $file_a >$file_b
}
# Traductor
function traductor() {
    data_1=$1
    echo $data1 | cpou
}
# Copiar historial
function cphi() {
    cat ~/.bash_history >.function_history
    tac .function_history | fzf --no-sort | xclip -selection clipboard
}
# Copilador c++ y editor
function co() {
    file=$1
    g++ "$file.cpp" -o "$file"
    ./"$file"
}
# Ejecutar partes de archivos python3 con funciones "def".
function expy() {
    file="$1"
    number=$2
    argument="$3"
    echo "p$number("$argument")" >>"$file"
    python3 "$file"
    sed -i '$d' "$file"
}
# Mostrar la sintax de una funcion.
function sepy() {
    file="$1"
    number=$2
    echo "from inspect import getsource; print(getsource("p$number"))" >>"$file"
    python3 "$file"
    sed -i '$d' "$file"
}
# Ejecutar una parte de un archivo bash.
function exba() {
    file="$1"
    number=$2
    #argument="$3"
    #echo -e "\np$number" >>"$file"
    echo "p$number" >>"$file"
    ./"$file"
    sed -i '$d' "$file"
}
# Mostrar una parte de un archivo bash.
function seba() {
    file="$1"
    number="$2"
    function_name="p$number"

    # Busca y muestra la función en un script Bash
    sed -n "/^\s*\(function\s\+\)\?$function_name\s*()/,/^}/p" "$file"
}
# Temp
function temp() {
    cd "$(mktemp -d)"
    punto=$(pwd)              # En bash es necesario usar $() en un comando para asignar el resultado a una variable, dentro de una cadena tambien selo utiliza.
    touch "${punto}/borrador" # En bash se usan llaves {} para delimitar la variables en una cadena de texto.
    echo "#!/usr/bin/env python3" >"${punto}/borrador"
    nvim "${punto}/borrador"
}
function temb() {
    cd "$(mktemp -d)"
    punto=$(pwd)              # En bash es necesario usar $() en un comando para asignar el resultado a una variable, dentro de una cadena tambien selo utiliza.
    touch "${punto}/borrador" # En bash se usan llaves {} para delimitar la variables en una cadena de texto.
    echo "#!/bin/bash" >"${punto}/borrador"
    nvim "${punto}/borrador"
}

function asd() {
    qwe="$1"
    "$qwe" 2>&1 | tee nada | xclip -selection clipboard
}
# Usb
#/home/havel/Data/Scripts/Bash/Usb

function usbl() {
    #sudo mount /dev/sdb1 /mnt/usb

    if [ ! -d /mnt/usb/acar ]; then
        cp -r /mnt/f/acar /mnt/usb
        echo "El archivo fue copiado."
    else
        rm -r /mnt/usb/acar
        cp -r /mnt/f/acar /mnt/usb
        echo "El archivo ya existe"
        echo "El archivo fue remplazado."
    fi
    #sudo umount /mnt/usb
}

function dlpf() {
    url="$1"
    yt-dlp --merge-output-format mp4 --add-header "Referer: https://kick.com" --add-header "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:110.0) Gecko/20100101 Firefox/110.0" "$url"
}

#yt-dlp --cookies-from-browser chrome https://www.youtube.com/shorts/PInRCfY9lx8

# Mover archivos
function mvle() {
    cd /home/havel/Descargas
    mv *LECCI* /home/havel/data/almacen_git/pdff_lessons
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
# xbindkeys

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fnm
FNM_PATH="/home/havel/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
fi

# fnm
FNM_PATH="/home/havel/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
fi

# theme
#export GTK_THEME=Adwaita-dark
#killall nautilus && nautilus &

# Auto jump
. /usr/share/autojump/autojump.sh
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# fondo
#feh --bg-scale ~/Descargas/fondo.jpg
alias languagetool="java -jar ~/programs/LanguageTool-6.5/languagetool-commandline.jar"

# Autocompletado
# Activar autosuggestions
alias auto-on='export BASH_AUTOSUGGEST_ENABLE=1'
# Desactivar autosuggestions
alias auto-off='export BASH_AUTOSUGGEST_ENABLE=0'
# Pavucontrol
alias audio='pavucontrol'

# Bluetooth auto
# Conexión automática de ERAZER XT60PRO
#echo -e 'connect 41:42:FF:59:69:C6\nexit' | bluetoothctl
