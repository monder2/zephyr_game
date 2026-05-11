# Zephyr DevContainer Project

This repository is configured to use a development container for Zephyr development.
The goal is that a new user can clone the repo and run the project inside the container without manually installing Zephyr on the host.

## Requirements

- Docker
- Docker Compose
- Visual Studio Code
- VS Code Remote - Containers extension
- Internet access to pull Docker images and Zephyr sources

Optional for board flashing:
- USB access to the target board
- Board-specific flash tools, such as STM32CubeProgrammer for STM32 boards

## Key points

- The devcontainer is defined in `.devcontainer/`
- `docker-compose.yml` uses the public image `monder87/my-zephyr-dev-env:2.0.4`
- The `postCreateCommand` sources the Zephyr environment from `dependance/zephyr/zephyr-env.sh` and runs `west update`
- The host does not need a local Zephyr installation when using the container

## First-time setup

1. Clone the repository:

   ```bash
   git clone <repo-url>
   cd <repo-folder>
   ```

2. Open the repository in VS Code.

3. Open the Command Palette and choose `Remote-Containers: Reopen in Container`.

   - VS Code will use the `.devcontainer/devcontainer.json` and `docker-compose.yml` to start the container.
   - The public Docker image `monder87/my-zephyr-dev-env:2.0.4` will be pulled automatically.

4. Wait for the container to start and the post-create command to finish.

## Optional board-specific tools

If you build and flash a board that requires a vendor-specific flashing tool, install or provide that tool as needed.
For example, STM32 boards may require `STM32CubeProgrammer`.

## Building and flashing

The repository contains two Zephyr sample applications:

- `applications/01_app`
- `applications/02_app`

To build an application from inside the container, use one of the provided VS Code tasks or run:

```bash
cd applications/01_app
west build -b <board> .
```

To flash the board:

```bash
west flash
```

## Notes

- The `.gitignore` excludes build folders and the optional flash tool archive.
- If `dependance/zephyr` is not already present, `west update` will clone Zephyr into `dependance/zephyr`.
- If you want to use this repo on another machine, make sure the Docker host can access USB devices and the `plugdev` group if needed.
