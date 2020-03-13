#!/bin/sh

set -eu

gitea_version='1.10.6'
gitea_checksum='4d876ab1c8f2bca3bdbfa9091821267ade938bf3'
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
