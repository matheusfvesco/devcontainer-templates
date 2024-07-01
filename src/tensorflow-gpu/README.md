
# Tensorflow GPU (NGC and pipx) (tensorflow-gpu)

A Python template with access to the host GPU (NVIDIA NGC Catalog), pipx and a few utilities

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| containerVersion | Defines the NVIDIA Tensorflow container version (year.month):  | string | 23.07 |
| tensorflowVersion | Tensorflow version (only tf2 from 23.04 and above): | string | tf2 |
| igpuVersion | If image is for NVIDIA Developer Kits with igpu (contaiver version 23.11 and above): | string | py3 |

## Container Version

To choose a container version, please refer to the [support matrix](https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html)

For more information, please refer to [Tensorflow NGC container documentation](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tensorflow).

## Installing or updating Python utilities

This container installs all Python development utilities using [pipx](https://pipxproject.github.io/pipx/) to avoid impacting the global Python environment. You can use this same utility add additional utilities in an isolated environment. For example:

```bash
pipx install prospector
```

See the [pipx documentation](https://pipxproject.github.io/pipx/docs/) for additional information.

---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/matheusfvesco/devcontainer-templates/blob/main/src/tensorflow-gpu/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
