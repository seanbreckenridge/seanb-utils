Python functions that I like having installed globally so I can quickly import them from other scripts

`seanb.notify`

```python
notify(msg: str, *, title: str) -> None
Python wrapper to call out to notify shell script
```

`seanb.jsonfast`: Speeds up JSON dump/load if [orjson](https://github.com/ijl/orjson) is installed. dumps also has a `minifed` flag which can compress JSON

```python
loads(jsonstr: str, **kwargs: Any) -> Any
dumps(obj: Any, minified: bool = False, default: Optional[Any] = None, **kwargs: Any) -> str
```

`seanb.clipboard`: Python wrappers for `clipcopy` and `clippaste`:

```python
clipcopy(data: str) -> None
Sends 'data' to 'clipcopy'; saving to your clipboard
clippaste() -> str
Paste text from your clipboard
```
