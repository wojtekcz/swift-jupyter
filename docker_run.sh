docker run -p 8888:8888 --cap-add SYS_PTRACE -v $(pwd)/..:/notebooks --name swift-jupyter swift-jupyter
