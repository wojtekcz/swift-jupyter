# docker_run.sh gpu|cpu_macos
# create container on GPU machine or on macOS

export PORT1=8888:8888 # jupyter lab
export PORT2=6006:6006 # tensorboard
# export PORT1=8081:8888  # for Wojtek's GCP

if [ "$1" == "gpu" ]; then
    cd ~
    docker run --name swift-jupyter -p $PORT1 -p $PORT2 --gpus all --privileged -v $(pwd):/notebooks swift-jupyter
fi

if [ "$1" == "cpu_macos" ]; then
    docker run --name swift-jupyter -p $PORT1 -p $PORT2 --cap-add SYS_PTRACE -v $(pwd)/..:/notebooks swift-jupyter
fi
