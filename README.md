Scripts/Tools extracted from my [dotfiles](https://github.com/seanbreckenridge/dotfiles) to make installing them easier

## Requires

This _does not install these_ and requires you to have these available (on your `$PATH`) before installing this:

- [GNU coreutils](https://www.gnu.org/software/coreutils/) (or some compatible set of utilities) - e.g. `cut`, `uniq`, `tr`
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
- [`dust`](https://github.com/bootandy/dust#install)

Needed for installing my core utilities:

- `python3` - <https://www.python.org/downloads/>
- `go` - <https://go.dev/doc/install>
- `cargo` - <https://doc.rust-lang.org/cargo/getting-started/installation.html>

## Install

To check for dependencies/path issues, run `make`

To install, run `make install` (no `sudo` required)

To setup `go`/`cargo` for installing from source, I would add something like this to your `.zshrc`/`.bashrc`:

```bash
# if not already set
export XDG_DATA_HOME="${HOME}/.local/share"

# Go (see 'go help install')
export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"

# Cargo (rust)
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

# update $PATH
export PATH="\
${HOME}/.local/bin:\
${XDG_DATA_HOME}/go/bin:\
${XDG_DATA_HOME}/cargo/bin:\
${PATH}"
```

### Contents

- `python`
  - lots of `./shellscripts/` here use python3
  - The `./python-src` namespace package, which includes lots of helper functions
- `go` - <https://go.dev/doc/install>
  - [newest](https://github.com/seanbreckenridge/newest)
  - [chomp](https://github.com/seanbreckenridge/chomp)
  - [fzfcache](https://github.com/seanbreckenridge/fzfcache)
  - [spkglist](https://github.com/seanbreckenridge/spkglist)
  - [on_machine](https://github.com/seanbreckenridge/on_machine)
- `cargo` - <https://doc.rust-lang.org/cargo/getting-started/installation.html>
  - [evry](https://github.com/seanbreckenridge/evry)
  - [wait-for-internet](https://github.com/seanbreckenridge/wait-for-internet)

### Reasons

In scripts which I want to publish on other repos/READMEs I end up copying/duplicating a helper script I've had written in my dotfiles, or just skipping that altogether and [linking to the script](https://github.com/seanbreckenridge/subpath-serve) on my dotfiles repository

I have a couple python functions/scripts that use a few useful python libraries that I use for personal config/scripts, which would be nice to collect as a namespace package (so they're easy to import/extend) somewhere

I have lots of (I think, useful) scripts that use my other scripts internally, but its hard to share them when they use so many of my other scripts internally -- this allows me to share them with others

Is nice to have a check/installer for all my core dependencies/cli tools when installing a new system
