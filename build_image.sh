#!/bin/bash

# usage) bash ./build_image.sh

# build faild tags: 2.7 2.8 3.0 3.1 3.2 3.3 3.4 3.5 3.6
TAGS="3.7 3.8 3.9 3.10"

build_image(){
    local GIT_REFS=$1
    local DOCKER_TAG=${2:-$GIT_REFS}
    (docker build -t "ryozitn/sockperf:$DOCKER_TAG" --build-arg TAG=$GIT_REFS . && docker push "ryozitn/sockperf:$DOCKER_TAG") || true
}

for TAG in $TAGS; do
    echo "Building $TAG"
    build_image "$TAG"
done

# latest build
build_image "HEAD" "latest"
