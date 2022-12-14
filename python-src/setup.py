import os
from pathlib import Path
from setuptools import setup, find_namespace_packages  # type: ignore[import]


def main() -> None:
    this_dir = Path(__file__).absolute().parent
    if os.getcwd() != str(this_dir):
        print(f"setuptools: cd'ing to {this_dir}")
        os.chdir(this_dir)

    setup(
        name="seanb-core",
        packages=find_namespace_packages("src"),
        url="https://github.com/seanbreckenridge/core",
        author="Sean Breckenridge",
        author_email="seanbrecke@gmail.com",
        python_requires=">=3.8",
        package_dir={"": "src"},
        zip_safe=False,
        description="seanb core utilities/functions",
        package_data={"seanb": ["py.typed"]},
        license="MIT",
        version="0.1.0",
    )


if __name__ == "__main__":
    main()
