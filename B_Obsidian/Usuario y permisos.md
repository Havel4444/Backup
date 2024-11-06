[[index]]
[[index_linux]]
# USUARIO
#2Usuario

#### CREACION

**Usuario y direcctorio**:
1. Manual: agregacion del shell y el directorio. 
```bash
sudo useradd ramon -m -s /bin/zsh 
```
2. Automatica: agrega por predeterminado la shell /bin/bash y crea su directorio en /home
```bash
sudo useradd -m ramon
```
- Mas comandos disponibles con:
```bash
man useradd
```
**Contraseña**:
```bash
sudo passwd ramon
```

#### ELIMINACION

**Usuario**:
```bash
sudo userdel -r ramon
```




# GRUPO
#2Grupo
#### asd








# PERMISOS
#2Permisos

**File: passwd**:
- El comando ramon:x:1001:1001::/home/ramon:/bin/zsh representa la entrada de un usuario llamado "ramon" en el archivo /etc/passwd, incluyendo su nombre de usuario, ID, grupo, directorio home, y shell de inicio.
- Además de la letra `x` en el campo de contraseña, en versiones antiguas de Unix o en configuraciones menos seguras, es posible que aparezca:
1. **La contraseña cifrada**: En sistemas más antiguos, la contraseña cifrada podía estar directamente en el campo de contraseña del archivo `/etc/passwd`. Sin embargo, por razones de seguridad, las contraseñas se almacenan ahora en el archivo `/etc/shadow` en la mayoría de los sistemas modernos.
2. **Campo vacío** (`:` seguido de otro `:`): Esto significa que la cuenta no tiene contraseña. En este caso, cualquier persona puede iniciar sesión en esa cuenta sin tener que ingresar una contraseña, lo cual es muy inseguro. 
3. **`*` o `!`**: Algunas distribuciones usan `*` o `!` en lugar de `x` para indicar que la cuenta está bloqueada. Esto impide que el usuario inicie sesión, incluso si se define una contraseña en el archivo `/etc/shadow`.
