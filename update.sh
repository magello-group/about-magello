#!/bin/bash

echo ""
echo "1. Hämtar det senaste från Github"
git pull > /dev/null
 
status=$(git status)

if [[ "$status" == *"working tree clean"* ]]; then
    echo ""
    echo "  ✅  Klart!  Du har inga lokala ändringar att sync:a till Github"
    echo ""
    exit
fi

echo "2. Förbereder alla uppdaterade och borttagna filer för att skickas till Github"
echo ""
git add .

git status

read -p "👉 Beskriv vad du uppdaterade (Max 100tkn): " msg

if [ -z "${msg}" ]; then
    msg="Uppdaterade fil(er)"
fi
git commit -m "$msg" > /dev/null

echo "3. Sparar alla filer på Github"
git push

echo ""
echo "  ✅ Klart! Filerna ligger på Github, och en ny about-magello.zip byggs nu."
echo ""
