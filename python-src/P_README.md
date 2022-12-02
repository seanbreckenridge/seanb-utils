Python functions that I like having installed globally so I can quickly import them from other scripts

This is a [namespace package](https://packaging.python.org/en/latest/guides/packaging-namespace-packages/), meaning you can install multiple directory structures, see my [personal `seanb` package](https://github.com/seanbreckenridge/dotfiles/tree/master/.config/seanb)

`seanb.notify`

```
>>>PMARK
perl -E 'print "`"x3, "python", "\n"'
python3 -c 'import seanb.notify; help(seanb.notify.notify)' | sed -e '1d' | chomp
perl -E 'print "`"x3'
```
