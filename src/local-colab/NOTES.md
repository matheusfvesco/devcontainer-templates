Template created using the instructions provided [here](https://research.google.com/colaboratory/local-runtimes.html)

Ideally, it will allow to continue to run the same code locally without too much hassle.

## Instructions

1. Apply this template to the directory with the code you want to run
2. Build the container and attach to it
3. Open the Jupyter Notebook and select the kernel you want to use. There should be 2 listed, one for Python and one for R
4. Run your code.

## WARNING: Running untrusted code

This container expects a root user to access most of the files, including simples things like the list of installed pip packages. **The default setting is to build the container and log in using the root user**. This makes it easier for attackers to get access to your system and potentially gain control over it. **So only run your own code, or code fromtrusted sources.**.

You can opt out of using the root user by changing the `remoteUser` value to `"vscode"` in the `devcontainer.json`. But this will require you to run most of the commands with sudo first.

## Connecting runtime to Google Colab

If you uncomment the `forwardPorts` session inside the `.devcontainer/devcontainer.json`, you can follow the instructions [here](https://research.google.com/colaboratory/local-runtimes.html) to connect your runtime to Google Colab and run code there, using your local machine.