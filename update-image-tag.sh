USAGE="$(basename $0) SERVICE TAG"

[ "$1" ] || {
    echo "Service name is missing!"
    echo "Usage: $USAGE"
    exit 1
}

[ "$2" ] || {
    echo "Service version (tag) is missing!"
    echo "Usage: $USAGE"
    exit 2
}

SRV=$1
TAG=$2

sed -ri "s|(image: [^:]*):.*|\1:${TAG}|" ./app/base/$SRV/*deployment.yml
