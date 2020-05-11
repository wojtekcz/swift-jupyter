# docker_build.sh gcp|local
# build docker image on GCP instance or locally

if [ "$1" == "local" ]; then
    # assuming swift toolchain tgz file is downloaded
    cd ..
    # https://lifehacker.com/start-a-simple-web-server-from-any-directory-on-your-ma-496425450
    python -m SimpleHTTPServer 8000 &
    cd swift-jupyter.gt

    # LOCAL_IP for http server, can't be localhost
    export LOCAL_IP=http://172.20.10.10:8000
    # export LOCAL_IP=http://192.168.2.100:8000
    export SWIFT_TF_URL=$LOCAL_IP/swift-tensorflow-RELEASE-0.9-cuda10.2-cudnn7-ubuntu18.04.tar.gz
    docker build -f docker/Dockerfile -t swift-jupyter --build-arg swift_tf_url=$SWIFT_TF_URL .
fi

if [ "$1" == "gcp" ]; then
    export SWIFT_TF_URL=https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.9/rc1/swift-tensorflow-RELEASE-0.9-cuda10.1-cudnn7-ubuntu18.04.tar.gz
    docker build -f docker/Dockerfile -t swift-jupyter --build-arg swift_tf_url=$SWIFT_TF_URL .
fi
