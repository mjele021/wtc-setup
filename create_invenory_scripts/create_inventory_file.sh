#!/usr/bin/bash


out=$(nmap -p 22 20.20.10.* | grep "open" -B 4 | grep "20.20.*.*")

echo "$out" > out.txt

echo $(cut -b 22-32 out.txt) > out.txt

echo "[wethinkcode]"> inventory

echo $(cat out.txt) >> inventory

rm out.txt
