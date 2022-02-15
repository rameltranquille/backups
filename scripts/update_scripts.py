#!/usr/bin/python
import os, subprocess

print("Copying Scripts to Local Bin")
os.system("cp -rf /home/ramel/scripts/* /usr/local/bin/")
binFiles = subprocess.check_output("ls /usr/local/bin/", encoding="utf-8", 
        shell=True).rstrip().split("\n")
scriptFiles = subprocess.check_output("ls /home/ramel/scripts/",
        encoding="utf-8", shell=True).rstrip().split("\n")

for file in scriptFiles:
    if file in binFiles:
        print("Copied: ", file)
print("\nDONE!")



