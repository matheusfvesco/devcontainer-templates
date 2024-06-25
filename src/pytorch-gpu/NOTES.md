## SAFETY WARNING: This container copies your ~/.ssh directory inside the container

This container copies your `~/.ssh` directory inside the container in order to use the same keys from the server running the container. This is not recommended, specially when other users have access to the same machine. This was chosen in order to avoid problems with the following [default behavior](https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials#_using-ssh-keys) when using the remote-ssh extension:

> There are some cases when you may be cloning your repository using SSH keys instead of a credential helper. To enable this scenario, the extension will automatically forward your **local SSH agent** if one is running.

If you can't or don't wan't to set up a SSH key in every computer you use to develop, this means you won't be able to make pushes easily, for example.

## Container Version

To choose a container version, please refer to the [support matrix](https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html)

For more information, please refer to [Pytorch NGC container documentation](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch).

## Installing or updating Python utilities

This container installs all Python development utilities using [pipx](https://pipxproject.github.io/pipx/) to avoid impacting the global Python environment. You can use this same utility add additional utilities in an isolated environment. For example:

```bash
pipx install prospector
```

See the [pipx documentation](https://pipxproject.github.io/pipx/docs/) for additional information.
