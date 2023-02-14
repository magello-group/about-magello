#!/bin/bash

git pull
git add .
read -p "Vad uppdaterade du (Max 100tkn): " msg

if [ -z "${msg}" ]; then
    msg = "Updated file(s)"
fi
git commit -m '$msg'


