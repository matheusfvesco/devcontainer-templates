
# Python Utils (Pipx Tools) (python-utils)

A Python template with pipx and some tools

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Python version (use -bookworm, or -bullseye variants on local arm64/Apple Silicon): | string | 3.12-bookworm |

## Installing or updating Python utilities

This container installs all Python development utilities using [pipx](https://pipxproject.github.io/pipx/) to avoid impacting the global Python environment. You can use this same utility add additional utilities in an isolated environment. For example:

```bash
pipx install prospector
```

See the [pipx documentation](https://pipxproject.github.io/pipx/docs/) for additional information.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/matheusfvesco/devcontainer-templates/blob/main/src/python-utils/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
