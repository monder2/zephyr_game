
#!/usr/bin/env bash


echo "the setup.sh file is being executed"

cd /workdir
if [ ! -f west.yml ]; then
  echo "Error: west.yml not found in /workdir" >&2
  exit 1
fi

ZEphyr_ENV="/workdir/dependance/zephyr/zephyr-env.sh"
if [ -f "$ZEphyr_ENV" ] && bash -lc "source '$ZEphyr_ENV'"; then
  echo "Zephyr env sourced"
else
  echo "Sourcing failed or missing — running west init/update"
  west init -l .

# Make sure the workspace contains Git repositories matching the projects in the manifest file
echo "[setup.sh] Updating west repository"
  west update

# Install Python dependencies required by Zephyr
echo "[setup.sh] Installing Python dependencies required by Zephyr"
pip install -r /workdir/dependance/zephyr/scripts/requirements.txt

# Install Python dependencies required by MCUBoot
echo "[setup.sh] Installing Python dependencies required by MCUBoot"
pip install -r /workdir/dependance/mcuboot/scripts/requirements.txt

# Export Zephyr-specific build system metadata to the 'workdir' directory
echo "[setup.sh] Exporting Zephyr-specific build system metadata to the 'workdir' directory"
west zephyr-export

fi


echo "the setup.sh file is end executed"
