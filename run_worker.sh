#!/bin/bash

usage() {
    echo "Usage: $0 [-n <string>]"
    echo "options:"
    echo "  -n     Name of the worker node"
    echo "  -h     Print this Help."
    1>&2; exit 1;
}

while getopts ":n:" o; do
    case "${o}" in
        n)
            n=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "${n}" ]; then
    usage
fi

docker run -it --rm --network swarm --name "$n" --mount source=shared-volume,target=/app/output celery ./run_celery.sh
