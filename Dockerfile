FROM fedora

# Packages
ENV PACKAGES @development-tools wget

# Install packages
RUN dnf -y update && dnf -y install $PACKAGES

# Set a passwordless sudoer user
RUN useradd -m -G wheel -s /bin/bash megatron && \
    mkdir -p /etc/sudoers.d/ && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

# Switch to the megatron user
WORKDIR /home/megatron
USER megatron

# User environment
ENV TERM=linux
RUN echo 'PS1="\n\n>> fedora \W \$ "' >> ~/.bashrc

CMD bash
