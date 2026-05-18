#!/usr/bin/env bash
set -e

echo ">>> [setup.sh] Starting Zephyr environment setup..."

cd /workdir

if [ ! -f "west.yml" ]; then
  echo "Error: west.yml not found in /workdir" >&2
  exit 1
fi

if [ ! -d "/workdir/.west" ]; then
  echo ">>> [setup.sh] First run — creating west workspace config..."

  # ✅ FIX: manually create .west/config instead of running west init
  # This avoids west trying to place .west in the parent directory (/)
  mkdir -p /workdir/.west
  cat > /workdir/.west/config <<EOF
[manifest]
    path = .
    file = west.yml

[zephyr]
    base = dependance/zephyr
EOF

  echo ">>> [setup.sh] Running west update (this may take a while)..."
  west update

  echo ">>> [setup.sh] Installing Python dependencies required by Zephyr..."
  pip install --user -r /workdir/dependance/zephyr/scripts/requirements.txt

  echo ">>> [setup.sh] Installing Python dependencies required by MCUBoot..."
  pip install --user -r /workdir/dependance/mcuboot/scripts/requirements.txt

  echo ">>> [setup.sh] Exporting Zephyr build system metadata..."
  west zephyr-export

else
  echo ">>> [setup.sh] Workspace already initialized — skipping setup."

  ZEPHYR_ENV="/workdir/dependance/zephyr/zephyr-env.sh"
  if [ -f "$ZEPHYR_ENV" ]; then
    echo ">>> [setup.sh] Sourcing Zephyr environment..."
    source "$ZEPHYR_ENV"
  else
    echo "Warning: zephyr-env.sh not found — run west update manually." >&2
  fi
fi

echo ">>> [setup.sh] Setup complete! ✅"