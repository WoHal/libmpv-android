#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "building Docker image..."
podman build -t mpv-android-builder "$SCRIPT_DIR"

echo "starting the container..."
# forward all arguments
podman run --rm \
    -v "$PROJECT_DIR:/home/mpvbuilder/mpv-android" \
    --env-file docker-env \
    mpv-android-builder "$@"