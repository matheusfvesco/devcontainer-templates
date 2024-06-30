## Container Version

To choose a container version, please refer to the [support matrix](https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html)

For more information, please refer to [Tensorflow NGC container documentation](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tensorflow).

## Installing or updating Python utilities

This container installs all Python development utilities using [pipx](https://pipxproject.github.io/pipx/) to avoid impacting the global Python environment. You can use this same utility add additional utilities in an isolated environment. For example:

```bash
pipx install prospector
```

See the [pipx documentation](https://pipxproject.github.io/pipx/docs/) for additional information.