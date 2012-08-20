#!/bin/bash

if [ -e randomdata ]; then
    rm -f randomdata
fi
touch randomdata

STRING="a-zA-Z"
PHONE="0-9"
echo -ne "Generating file..."
for i in {1..1000}
do
nameLen=$((RANDOM%5+5))
name=$(cat /dev/urandom | tr -dc $STRING | head -c$nameLen)

phoneLen=10
phone=$(cat /dev/urandom | tr -dc $PHONE | head -c$phoneLen)

emailLen=$((RANDOM%3+3))
email=$(cat /dev/urandom | tr -dc $STRING | head -c$emailLen)

echo "$name $phone $name@$email.com" >> randomdata
echo -ne "."
done

echo ""
echo "Done creating test file"