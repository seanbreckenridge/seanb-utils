"""
Python wrapper to call out to notify shell script
"""

import shlex
from subprocess import check_call


def notify(msg: str, *, title: str) -> None:
    check_call(["notify", shlex.quote(title), shlex.quote(msg)])
