#!/bin/bash

usage() {
    echo "Usage: $0 [-n worker -p <string>]"
    echo "options:"
    echo "  -n     which node is going submit the job"
    echo "  -p     path to a list of websites that are supposed to be crawled"
    echo "  -h     Print this Help."
    1>&2; exit 1; 
}

while getopts ":n:p:" o; do
    case "${o}" in
        n)
            n=${OPTARG}
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "${p}" ] || [ -z "${n}" ]; then
    usage
fi

docker cp "$p" "$n":/app/list.csv
docker exec -it "$n" python celery_extract_links.py list.csv