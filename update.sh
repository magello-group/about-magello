#!/bin/bash

echo "1. Hämtar det senaste från Github"
git pull

echo "2. Förbereder alla uppdaterade och borttagna filer för att skickas till Github"
git add .

read -p "Beskriv vad du uppdaterade (Max 100tkn): " msg

if [ -z "${msg}" ]; then
    msg="Uppdaterade fil(er)"
fi

echo "3. Sparar alla filer på Github"
git commit -m '$msg'

echo "4. Klart!"