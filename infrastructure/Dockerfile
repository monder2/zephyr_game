FROM zephyrprojectrtos/zephyr-build:latest

USER root

# Install dependencies required by STM32CubeProgrammer
RUN apt-get update && apt-get install -y \
    libusb-1.0-0 \
    libusb-1.0-0-dev \
    libxcb1 \
    libx11-6 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Copy the offline installer into the container
COPY requirement/en.stm32cubeprg-lin-v2-19-0.zip /tmp/stm32cubeprog.zip

USER user
