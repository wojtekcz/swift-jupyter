# docker_run.sh gcp|local
# create container on GCP instance or locally

if [ "$1" == "gcp" ]; then
    cd ~
    docker run --gpus all --name swift-jupyter -p 8081:8888 --privileged -v $(pwd):/notebooks -v swift-jupyter swift-jupyter
fi

if [ "$1" == "local" ]; then
    export PORT1=8888:8888
    docker run -p $PORT1 --cap-add SYS_PTRACE -v $(pwd)/..:/notebooks --name swift-jupyter swift-jupyter
fi
