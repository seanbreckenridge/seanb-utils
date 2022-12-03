scripts extracted from my [dotfiles](https://github.com/seanbreckenridge/dotfiles), see [index](#script-index)

This includes:

- Pure utility/wrangling scripts like `lower`, `upper`, `chomp`, `rcut`, `tally`, `unique`, `average`; which help process outputs of other commands, which are commonly used by other shellscripts I put up on other repositories -- hence the reason to make this repo so they're easily installable
- Some helper/conversion scripts like `to-png`, `to-jpeg`, `rotate-img`, `tq` (`jq` for `toml`)
- Scripts that provide platform-independent interaction with clipboard/prompting user for input/sending notifications
- Other random scripts which have more niche uses, but I feel are worth to publish here, with checks for required commands at runtime

## Requires

This _does not install these_ and requires you to have these available (on your `$PATH`) before installing this:

- [GNU coreutils](https://www.gnu.org/software/coreutils/) (or some compatible set of utilities) - e.g., `cut`, `uniq`, `tr`
- [util-linux](https://en.wikipedia.org/wiki/Util-linux) - e.g., `shuf`, `rev`, `kill`
- `find`
- `grep`
- `curl`
- `wget`
- `awk`
- `sed`
- `realpath`

Optional/Recommended (some scripts here will fail if these aren't present)

- `rsync`
- [`rg`](https://github.com/BurntSushi/ripgrep#installation)
- [`fzf`](https://github.com/junegunn/fzf#installation)
- [`fd`](https://github.com/sharkdp/fd#installation)

Needed for installing/building core utils used in other scripts here:

- `python3` - <https://www.python.org/downloads/>
- `go` - <https://go.dev/doc/install> (skips installs if `go` not found)

## Install

To check for dependencies/path issues, run `make`

To install, run `make install`:

```bash
git clone https://github.com/seanbreckenridge/core
cd ./core
make  # check for dependencies
make install
```

Or use [`bpkg`](https://github.com/bpkg/bpkg) to automate the manual `git clone`/`cd`/`make`:

```
bpkg install -g seanbreckenridge/core
```

To setup `go` to build packages, add something like this to your `.zshrc`/`.bashrc`:

```bash
# if not already set
export XDG_DATA_HOME="${HOME}/.local/share"

# Go (see 'go help install')
export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"

# update $PATH
export PATH="\
${HOME}/.local/bin:\
${XDG_DATA_HOME}/go/bin:\
${PATH}"
```

## Contents

Requires `python 3.8+`/`golang` to install:

### Script Index

`make install` installs:

- a few `go` CLI tools - (See <https://go.dev/doc/install> for install instructions)
  - [`newest`](https://github.com/seanbreckenridge/newest) - print most recently modified file in directory
  - [`chomp`](https://github.com/seanbreckenridge/chomp) - remove whitespace/empty lines from command output
  - [`on_machine`](https://github.com/seanbreckenridge/on_machine) - detect what operating system/machine you're currently on
- The `./python-src` namespace package, which includes helper functions, see [python-src/README.md](./python-src/README.md). Also installs required python libraries for any python scripts here

... and shellscripts:

#### shellscripts

- File/Utility Scripts
  - `havecmd` - command to check if commands are available
  - `dir-size` - prints the total size of a directory
  - `symlink` - a helper script to make a symlink since I always forget how to
  - `openurl`/`openurls` - cross platform URL opener
  - `get-extension`, `remove-extension`, `replace-extension` - helpers to create output filename strings
  - Lots of date shorthands: `daystamp`, `daystamp_`, `epoch`, `month`, `weekday`, `year`
  - `path`: prints your `$PATH`, separated by newlines
- File Formats
  - `json-compress` - compresses JSON (removes extra spaces/newlines), only writes to the file if size of data was changed
  - `tq` - converts a TOML file to JSON, usually piped to [jq](https://github.com/stedolan/jq). e.g.,: `tq <data.toml | jq '.conf'`
  - `to-png`/`to-jpg` - converts an image to a png/jpg
  - `img-download` - downloads an image from your clipboard to your tmpdir, moves it so that the extension is valid
- Data Wrangling
  - `lower`/`upper` - converts all text from STDIN to lowercase/uppercase
  - `prefix`/`suffix` - prepends/adds a string to the beginning/end of each line from STDIN
  - `capitalize` - 'capitalizes' (first letter of) input, e.g. WORD -> Word; word -> Word
  - `average` - finds the mean of numerical data piped from STDIN
  - `rcut` - `cut`, by indexing from the right instead
  - `sort-by-last-col` - sorts text by last column of text; columns can vary in length
  - `tally` - shorthand for 'sort | uniq -c | sort -n'
  - `unique` - `uniq`, but doesn't require input to be sorted
  - `group-and-termgraph` - takes lines of data and groups/graphs it using [termgraph](https://github.com/mkaz/termgraph). Sort of like a fancy 'sort | uniq -c | sort -n'
  - `epochdisplay` - given one or more epoch timestamps (`date +"%s"`) prints a readable date. If no args are given, reads from STDIN
  - `epochguess` - reads anything from STDIN. convert any epoch timestamps that looks like a datetime to local-readable timestamps
- Media
  - `mduration` - prints the duration of a media file (movie/audio)
  - `mtotal` - given a bunch of media files, gives the total duration in minutes
  - `image-dimensions` - prints the width/height for images passed as arguments
  - `list-movies`/`list-music` - lists any music/movies in the current directory recursively. any additional args are passed onto [`fd`](https://github.com/sharkdp/fd), e.g. `list-music -X mduration`
- Others:
  - `shebang` - creates a script with the given shebang. If a known language, adds a basic template
  - `gifme` - Creates a gif from a (section of a) video file. Lets you specify start/end times and an fps for the gif to run at
  - `ix` - terminal pastebin replacement -- anything piped to STDIN gets uploaded to <http://ix.io> and a link is copied to your clipboard
  - `html-head`: a script to generate `<head>` tags for generated HTML, I often use this like: `pandoc README.md | html-head -a css-dark-mode -a css-pre-wrap | remsync-html-from-stdin` to convert some local markdown file to a basic dark-mode webpage and publish it onto my website with [`remsync`](https://github.com/seanbreckenridge/vps/blob/master/remsync)
  - `git` - these are helpers that return `0` if the condition is met, they're used like: `in-gitdir && command_do_something`
    - `in-gitdir` - currently in a git directory
    - `has-git-remote` - has a `git remote --verbose`

Cross Platform Helpers - these use [on_machine](https://github.com/seanbreckenridge/on_machine) to run different commands based on what operating system you're on.

- `clipcopy`/`clippaste` - save to/read from clipboard
- `input-dialog` - prompts the user to enter some text with an OS-dialog
- `notify` - sends a OS notification (`notify-send` on linux/`applescript` on mac)
- `picker` - prompts user to pick from lines received from STDIN
