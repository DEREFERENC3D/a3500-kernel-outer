FROM python:2

# Fix up the package manager - Debian changes the domain when releases go out of support
RUN sed -i \
  's/deb.debian.org/archive.debian.org/; s/security.debian.org/archive.debian.org/' \
  /etc/apt/sources.list

# Update
RUN apt update && apt -y full-upgrade

# Install deps - some BS generation scripts by MTK are 32-bit and require libc
RUN apt install -y libc6-i386

# Activate 32-bit arch for some packages not available as "multilib"
RUN dpkg --add-architecture i386 && apt update

# Install 32-bit deps
RUN apt install -y libstdc++6:i386

ENTRYPOINT ["bash"]
