import os, subprocess

def next_event(): 

    event = subprocess.check_output("head -2 /tmp/gcalcli_agenda.txt | tail -1", shell=True).decode('utf-8')
    print(event)

next_event()
