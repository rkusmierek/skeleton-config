USAGE="$(basename $0) IMAGE TAG"

[ "$1" ] || {
    echo "Service image name is missing!"
    echo "Usage: $USAGE"
    exit 1
}

[ "$2" ] || {
    echo "Service version (tag) is missing!"
    echo "Usage: $USAGE"
    exit 2
}

IMAGE=$1
TAG=$2

sed -ri "s|(image: ${IMAGE}):.*|\1:${TAG}|" ./app/base/*/*deployment.yml
