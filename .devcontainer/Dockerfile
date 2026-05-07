FROM zephyrprojectrtos/zephyr-build:latest

USER root

# STM32-only: install dependencies needed by STM32CubeProgrammer.
# Uncomment this block if you are building the image for STM32 board support.
# RUN apt-get update && apt-get install -y \
#    libusb-1.0-0 \
#    libusb-1.0-0-dev \
#    libxcb1 \
#    libx11-6 \
#    unzip \
#    minicom \
#    && rm -rf /var/lib/apt/lists/*

# STM32-only: Copy the offline STM32CubeProgrammer installer into the container.
# COPY requirement/stm32cubeprog-portable2_20_0.tar.gz /tmp/stm32cubeprog.tar.gz

# STM32-only: Install STM32CubeProgrammer portable archive into the user's home and
# make its binaries available in PATH. Use an ARG for the username so the
# path can match the base image's user (default 'user').
# ARG USER=user
# ENV USER=${USER}
# ENV STM32_ROOT=/home/${USER}/STMicroelectronics

# STM32-only: Create target dir, extract the provided archive, and set ownership.
# RUN mkdir -p ${STM32_ROOT} \
#  && tar -xzf /tmp/stm32cubeprog.tar.gz -C ${STM32_ROOT} \
#  && chown -R ${USER}:${USER} ${STM32_ROOT} \
#  && rm -f /tmp/stm32cubeprog.tar.gz

# STM32-only: Make the CubeProgrammer binaries available at runtime and for interactive
# shells by adding a small profile script. Using ENV ensures PATH is set
# for non-interactive containers as well.
# ENV PATH="${STM32_ROOT}/STM32Cube/STM32CubeProgrammer/bin:${PATH}"
# RUN printf '%s\n' "export PATH=${STM32_ROOT}/STM32Cube/STM32CubeProgrammer/bin:\$PATH" > /etc/profile.d/stm32cubeprog.sh \
#  && chmod 644 /etc/profile.d/stm32cubeprog.sh

USER user