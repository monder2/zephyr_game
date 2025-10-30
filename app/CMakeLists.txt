cmake_minimum_required(VERSION 3.20.0)

# Pulls in the Zephyr build system
find_package(Zephyr REQUIRED HINTS /workdir/depandance/zephyr)

project(blinky_app)

# Add your source files to the Zephyr 'app' target
target_sources(app PRIVATE src/main.c)
