FROM nvcr.io/nvidia/pytorch:${templateOption:containerVersion}-py3${templateOption:igpuVersion}

# Prevent some packages from requesting interactive input
ENV DEBIAN_FRONTEND=noninteractive

# installs pipx and clears cache
RUN apt update && apt-get install -y pipx && pipx ensurepath && rm -rf /var/lib/apt/lists/*