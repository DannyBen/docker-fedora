FROM fedora

# Packages
ENV PACKAGES @development-tools wget

# Install packages
RUN dnf -y update && dnf -y install $PACKAGES

# Set a passwordless sudoer user
RUN useradd -m -G wheel -s /bin/bash guest && \
    mkdir -p /etc/sudoers.d/ && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

# Switch to the guest user
WORKDIR /home/guest
USER guest

# User environment
ENV TERM=linux
RUN echo 'PS1="\n\n>> fedora \W \$ "' >> ~/.bashrc

CMD bash
