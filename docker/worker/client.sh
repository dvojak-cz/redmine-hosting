#!/bin/bash

set -ex

new() {
    local name="$1"
    local env_file="$2"
    local host="${3:-}"

    docker $host network inspect back_channel-bridge > /dev/null 2>&1 || \
    docker $host network create back_channel-bridge

    docker $host run \
            --name $name \
            $(<$env_file) \
            --network back_channel-bridge \
            --restart always \
            -p 3000:3000 \
            -d \
                redmine
}

delete() {
    local name="$1"
    local host="${2:-}"
    docker $host stop $name
    docker $host rm $name 
}



# Check command-line arguments
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 [new|delete] args... [optional_host]"
    exit 1
fi

case "$1" in
    new)
        # Check if enough arguments are supplied for 'new'
        if [ "$#" -lt 3 ]; then
            echo "Usage: $0 new [name] [env_file] [optional_host]"
            exit 1
        fi
        new "$2" "$3" "$4"
        ;;
    delete)
        # Check if enough arguments are supplied for 'delete'
        if [ "$#" -lt 2 ]; then
            echo "Usage: $0 delete [name] [optional_host]"
            exit 1
        fi
        delete "$2" "$3"
        ;;
    *)
        echo "Invalid command"
        echo "Usage: $0 [new|delete] args... [optional_host]"
        exit 1
        ;;
esac