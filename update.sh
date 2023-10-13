#!/bin/bash

echo ""
echo "1. Hämtar det senaste från Github"
pull==$(git pull)

status=$(git status)

if [[ "$status" == *"On branch main Your branch is up to date with"* ]]; then
    echo ""
    echo "  ✅  Klart - Du har inga ändringar att sync:a till Github"
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
git commit -m "$msg"

echo "3. Sparar alla filer på Github"
push=$(git push)

echo ""
echo "  ✅ Klart!"
echo ""
