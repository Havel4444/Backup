#!/bin/bash

read -p "cual es tu edad?: " age

if [ $age -ge 18 ] && [ $age -le 35 ]; then
    echo "eres apto"
elif [ $age -lt 18 ]; then
    echo "aun no"
elif [ $age -gt 35 ]; then
    echo "ya no."
else
    echo "error."
fi

