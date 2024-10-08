
# Python Docker (DinD) (python-dind)

A Python template with pipx, some tools, and Docker in Docker

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Python version (use -bookworm, or -bullseye variants on local arm64/Apple Silicon): | string | 3.12-bookworm |

This template have Docker in Docker installed, which can be useful for containerizing applications and services, or to develop applications with web frameworks like Django and FastAPI.

## Installing or updating Python utilities

This container installs all Python development utilities using [pipx](https://pipxproject.github.io/pipx/) to avoid impacting the global Python environment. You can use this same utility add additional utilities in an isolated environment. For example:

```bash
pipx install prospector
```

See the [pipx documentation](https://pipxproject.github.io/pipx/docs/) for additional information.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/matheusfvesco/devcontainer-templates/blob/main/src/python-dind/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
