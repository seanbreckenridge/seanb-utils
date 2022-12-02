import shlex
from subprocess import check_call


def notify(msg: str, *, title: str) -> None:
    """
    Python wrapper to call out to notify shell script
    """
    check_call(["notify", shlex.quote(title), shlex.quote(msg)])
