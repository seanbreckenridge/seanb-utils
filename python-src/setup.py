import os
from pathlib import Path
from setuptools import setup


def main() -> None:
    this_dir = Path(__file__).absolute().parent
    if os.getcwd() != str(this_dir):
        print(f"setuptools: cd'ing to {this_dir}")
        os.chdir(this_dir)

    setup()


if __name__ == "__main__":
    main()
