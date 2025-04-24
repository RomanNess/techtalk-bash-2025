#!/usr/bin/env bash
set -euo pipefail

BASE_IMAGE="${BASE_IMAGE:-alpine}"

if [[ "$#" == 0 ]]; then
  cat << EOF
🐳 Usage: $0 <TOOLS_TO_INSTALL_WITH_APK>...
🐳 Creates alpine based docker images for local debugging.
EOF
  exit 1
fi

# create tmp image name from provided parameters
image_tag=$(printf "%s-" "$@" | sed 's/-$//')
tmp_image="tmp-${BASE_IMAGE}:${image_tag}"
echo "🐳 Creating tmp image: ${tmp_image}"

# install tools in container
docker run "${BASE_IMAGE}" apk add --no-cache "$@"

# create image out of stopped container
last_container_id=$(docker ps --all --latest --quiet)
docker commit "${last_container_id}" "${tmp_image}"
