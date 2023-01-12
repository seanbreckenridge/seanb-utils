import subprocess


def clipcopy(data: str) -> None:
    """
    Sends 'data' to 'clipcopy'; saving to your clipboard
    """
    proc = subprocess.run(["clipcopy"], input=data.encode())
    proc.check_returncode()


def clippaste() -> str:
    """
    Paste text from your clipboard
    """
    proc = subprocess.run(["clippaste"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    try:
        proc.check_returncode()
    except subprocess.CalledProcessError:
        return ""
    return proc.stdout.decode("utf-8")
