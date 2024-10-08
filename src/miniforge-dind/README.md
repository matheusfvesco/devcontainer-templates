
# Miniforge3 Docker (DnD and GPU) (miniforge-dnd)

A Python template with miniforge3 installed and --gpus all passed to the container, making it easy to develop any project.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | The miniforge version (MAJOR.MINOR.PATCHES): | string | 24.3.0-0 |

This container have miniforge installed on `/opt/conda` and is run with `--gpus all`. This makes installing tools like CUDA, Cuda Toolkit, cuDNN etc. much easier.

## Tip 1: Keep the Base environment Clean

Installing most things inside base is an option, but can sometimes slow down during package solving. [It is recommended to keep base clean of all dependencies except for those related to conda](https://github.com/conda/conda/issues/11919#issuecomment-1283923009). Create a new environent for your project.

## Tip 2: Use Libmamba

[Use Mamba](https://www.anaconda.com/blog/a-faster-conda-for-a-growing-community), a faster solver for conda.
Miniconda should already have libmamba installed.

---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/matheusfvesco/devcontainer-templates/blob/main/src/miniforge-dnd/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
