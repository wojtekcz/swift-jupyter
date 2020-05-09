# PWD=pwd
# cd ..
# python -m SimpleHTTPServer 8000 &
# cd $PWD
export LOCAL_IP=http://172.20.10.8:8000
# export LOCAL_IP=http://192.168.2.100:8000
export SWIFT_TF_URL=$LOCAL_IP/swift-tensorflow-RELEASE-0.9-cuda10.2-cudnn7-ubuntu18.04.tar.gz
docker build -f docker/Dockerfile -t swift-jupyter --build-arg swift_tf_url=$SWIFT_TF_URL .
