#!/bin/bash
# Замена в файлах
find .  -type f ! -path "./.git/*" ! -path "./*.sh" -print0 | xargs -0 sed -i "s/vm-name/$1/g"

# Замена в названиях файлов
find . -type f ! -path "./.git/*" -iname "*vm-name*" | sed -e "p;s/vm-name/$1/" | xargs -n2 mv
# Замена в названиях директорий
find . -type d ! -path "./.git/*" -iname "*vm-nam*" | sed -e "p;s/vm-name/$1/" | xargs -n2 mv