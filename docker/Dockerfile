# Use an official Arch Linux base image
FROM archlinux:latest

# Set environment variables
ENV API_URL="http://localhost:11434/api"
ENV MODEL_SMALL="gemma3:270m"
ENV NUM_PREDICT=500
ENV VERBOSE=2

# Update system and install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
        jq \
        bats \
        yq \
        inotify-tools \
        git \
        && pacman -Scc --noconfirm  # Clear package cache to reduce image size

# Set up directories for your script and testing
WORKDIR /app

# Copy the local files into the container
COPY . /app

# Ensure the script is executable
RUN chmod +x /app/shellm

# Install BATS for testing
RUN git clone https://github.com/bats-core/bats-core.git /opt/bats && \
    /opt/bats/install.sh /usr/local

# Set entrypoint to manage script interaction and testing
ENTRYPOINT ["bash", "/app/docker/entrypoint.sh"]
