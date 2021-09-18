import os
import sys
from os.path import exists

# TODO use environment variable if it is defined
password_file = "~/bin/vulnerable-passwords.txt"
program_name = "check-password"


def print_help():
    print("Help for program")
    sys.exit(0)


def is_string_in_file(pass_file, input_str):
    with os.open(pass_file, "r") as file:
        for line in file:
            if line.lower() == input_str.lower():
                return True
    return False


if __name__ == "__main__":
    argc = len(sys.argv)

    if argc < 2:
        print_help()
    else:
        string_to_compare = sys.argv[1]

    # check that passwords file exists
    if exists(password_file):
        is_present = is_string_in_file(password_file, string_to_compare)

        if is_present:
            sys.exit(0)
        else:
            sys.exit(1)
    else:
        print("Passwords file is missing")
        sys.exit(-1)

