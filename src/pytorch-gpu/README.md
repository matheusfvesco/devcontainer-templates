
# Pytorch GPU (NGC and pipx) (pytorch-gpu)

A Python template with access to the host GPU (NVIDIA NGC Catalog), pipx and a few utilities

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| containerVersion | Defines the NVIDIA Pytorch container version (year.month):  | string | 23.07 |
| igpuVersion | If image is for NVIDIA Developer Kits with igpu: | string | py3 |

## Container Version

To choose a container version, please refer to the [support matrix](https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html)

For more information, please refer to [Pytorch NGC container documentation](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch).

## Installing or updating Python utilities

This container installs all Python development utilities using [pipx](https://pipxproject.github.io/pipx/) to avoid impacting the global Python environment. You can use this same utility add additional utilities in an isolated environment. For example:

```bash
pipx install prospector
```

See the [pipx documentation](https://pipxproject.github.io/pipx/docs/) for additional information.

---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/matheusfvesco/devcontainer-templates/blob/main/src/pytorch-gpu/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
