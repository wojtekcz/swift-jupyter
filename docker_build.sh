# ./docker_build.sh or ./docker_build.sh cached
# build docker image with (optionally) cached swift toolchain

if [ "$1" != "cached" ]; then
    export SWIFT_TF_URL=https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.10/rc1/swift-tensorflow-RELEASE-0.10-cuda10.1-cudnn7-ubuntu18.04.tar.gz
fi

if [ "$1" == "cached" ]; then
    # assuming swift toolchain tgz file is downloaded
    # works on macOS
    cd ..
    # https://lifehacker.com/start-a-simple-web-server-from-any-directory-on-your-ma-496425450
    python -m SimpleHTTPServer 8000 &
    cd swift-jupyter.gt

    # LOCAL_IP for http server can't be localhost
    export LOCAL_IP=http://172.20.10.8:8000
    export SWIFT_TF_URL=$LOCAL_IP/swift-tensorflow-RELEASE-0.10-cuda10.1-cudnn7-ubuntu18.04.tar.gz
fi

docker build -f docker/Dockerfile -t swift-jupyter --build-arg swift_tf_url=$SWIFT_TF_URL .
