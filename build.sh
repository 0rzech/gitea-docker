#!/bin/sh

set -eu

gitea_version='1.10.4'
gitea_checksum='3c8842d58cace8bbaf36715a1171d24d3b97c497'
image_name='orzech/gitea'
source='https://gitlab.com/0rzech/gitea-docker'

if [ -n "${SOURCE_COMMIT:-}" ]; then
    source="${source}/src/commit/${SOURCE_COMMIT}"
fi

docker build \
  --disable-content-trust=false \
  --build-arg "gitea_version=${gitea_version}" \
  --build-arg "gitea_checksum=${gitea_checksum}" \
  --build-arg "source=${source}" \
  -t "${IMAGE_NAME:-${image_name}}" \
  .
