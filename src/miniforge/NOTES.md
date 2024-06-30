This container have miniforge installed on `/opt/conda` and is run with `--gpus all`. This makes installing tools like CUDA, Cuda Toolkit, cuDNN etc. much easier. It also have Docker Inside Docker, which can be used to develop dockerized applications, or to easily get databases up and running for your application.

## Tip 1: Keep the Base environment Clean

Installing most things inside base is an option, but can sometimes slow down during package solving. [It is recommended to keep base clean of all dependencies except for those related to conda](https://github.com/conda/conda/issues/11919#issuecomment-1283923009).

## Tip 2: Use Libmamba

[Use Mamba](https://www.anaconda.com/blog/a-faster-conda-for-a-growing-community), a faster solver for conda.
Miniconda should already have libmamba installed.