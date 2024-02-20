#!/bin/bash

function confirm_prompt {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

get_linux_distribution() {
    if command -v lsb_release &> /dev/null; then
        echo $(lsb_release -si)
    fi
}
