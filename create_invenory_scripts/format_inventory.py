#!/usr/bin/env python3

import os


os.system("./create_inventory_file.sh")


file = open("inventory", "r")
contents = file.read()
file.close()

contents = contents.replace(" ", "\n")

file = open("../inventory", "w")
file.write(contents)
file.close()

