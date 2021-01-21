#!/bin/bash

usage() {
    echo "Usage: $0 [-p <string>]"
    echo "options:"
    echo "  -p     path to a list of websites that are supposed to be crawled"
    echo "  -h     Print this Help."
    1>&2; exit 1; 
}

while getopts ":p:" o; do
    case "${o}" in
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "${p}" ]; then
    usage
fi

echo "p = ${p}"