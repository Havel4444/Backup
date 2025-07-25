sudo rsync -av --delete --exclude='/dev' --exclude='/proc' --exclude='/sys' --exclude='/tmp' \
    --exclude='/run' --exclude='/mnt' --exclude='/media' --exclude='/lost+found' \
    --exclude='/var/cache/apt/archives' --exclude='/var/tmp' \
    --exclude='/home/*/.cache' \
    / /media/havel/Nuevo\ vol/backup/
