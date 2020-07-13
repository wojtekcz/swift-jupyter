# docker_run.sh gpu|macos
# create container on GPU machine or on macOS

export PORT1=8888:8888 # jupyter lab
export PORT2=6006:6006 # tensorboard
# export PORT1=8081:8888  # for Wojtek's GCP

GPU_opts=""
macOS_opts=""

if [ "$1" == "gpu" ]; then
    GPU_opts="--gpus all"
fi

if [ "$1" == "macos" ]; then
    macOS_opts="--cap-add SYS_PTRACE"
fi

cd ..
docker run --name swift-jupyter -p $PORT1 -p $PORT2 $GPU_opts --privileged $macOS_opts -v "$(pwd)":/notebooks swift-jupyter
