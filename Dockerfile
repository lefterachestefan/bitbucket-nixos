FROM nixos/nix:2.35.1

# Create the necessary symlinks for Bitbucket
RUN ln -sf "$(which echo)" /bin/echo \
    && ln -sf "$(which cat)" /bin/cat \
    && ln -sf "$(which mkfifo)" /usr/bin/mkfifo

# Enable flakes
RUN printf '%s\n' \
    "experimental-features = nix-command flakes" \
    "accept-flake-config = true" \
    >> /etc/nix/nix.conf
