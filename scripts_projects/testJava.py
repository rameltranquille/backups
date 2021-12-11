#!/bin/python3 

import os, subprocess

def test(filename):
    case = ""
    test_file = "test_" + filename.rstrip('.java')
    subprocess.run(["touch", test_file])

    with open(test_file, 'a') as file:
        while case != "0":
            case = input("Type a line of input to test\n or type 0\n") #+ "\n"
            if case != "0\n" and case != "":
                file.write(case)
    inputs = subprocess.check_output("cat " + test_file, shell=True).decode('utf-8')
    inputs_list = inputs.split('\n')
    inputs_list.pop()

    for choice in inputs_list:
        print("--------- Testing Next Case ---------")
        testcmd = "echo " + choice + " | java " + filename
        print("Test Cases: " + choice)
        print("Solution")
        subprocess.call(testcmd, shell = True)


def main():
    filename = "TicTacToe.java"
    test(filename)
    # class_name = "Exercise" + ex_number
    # dir_name = "/home/ramel/Dropbox/fall2021/CompSci/RamelTranquille_Assignment_" #+ input("HW number: ")
    # opt = 1
    # opt = int(input("1 - Start Ex\n2 - Zip\n3 - Skip to Test\n-> "))

    #OPTION1 - start ex and testing environment
    # if opt == 1:
        # x = startExercise(class_name, dir_name)
    #OPTION2 - zip for submission
    # elif opt == 2:
        # zipper(dir_name)
    # elif opt == 3:
        # Skip to test 



if __name__ == "__main__":
    main()
