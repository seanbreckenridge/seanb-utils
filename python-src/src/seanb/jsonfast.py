"""
Uses orjson if its installed https://github.com/ijl/orjson
dumps can return compressed (minified) JSON (set minified=True)
"""

import json
from typing import Any, Optional


def loads(jsonstr: str, **kwargs: Any) -> Any:
    try:
        # speedup load if orjson is installed
        import orjson  # type: ignore[import]

        return orjson.loads(jsonstr, **kwargs)
    except ImportError:
        return json.loads(jsonstr, **kwargs)


def dumps(
    obj: Any, minified: bool = False, default: Optional[Any] = None, **kwargs: Any
) -> str:
    try:
        import orjson

        bt: bytes = orjson.dumps(obj, default=default, **kwargs)
        return bt.decode("utf-8")
    except ImportError:
        if minified and "separators" not in kwargs:
            kwargs["separators"] = (",", ":")
        return json.dumps(obj, default=default, **kwargs)
