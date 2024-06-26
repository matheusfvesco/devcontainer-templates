FROM nvcr.io/nvidia/tensorflow:${templateOption:containerVersion}-${templateOption:tensorflowVersion}-${templateOption:igpuVersion}

# Prevent some packages from requesting interactive input
ENV DEBIAN_FRONTEND=noninteractive

# installs apt-utils and clears cache
RUN apt update \
    && apt-get install -y apt-utils \
    && rm -rf /var/lib/apt/lists/* \