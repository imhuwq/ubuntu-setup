#!/bin/bash

source vars.sh

function call_seperator {
    echo ""
    echo "=============================="
}

function update_file {
    path="$1"
    line="$2"
    prefix="$3"

    if ! grep -Fxq "$line" "$path"; then
        if [ "$prefix" == "sudo" ]; then
            echo "$line" | sudo tee -a "$path"
            echo "" | sudo tee -a "$path"
        else
            echo "$line" >> "$path"
            echo "" >> "$path"
        fi
    fi
}

function delete_line {
    path="$1"
    line="${2//\//\\/}"
    prefix="$3"

    if [ "$prefix" == "sudo" ]; then
        sudo sed -i "/$line/d" $path
    else
        sed -i "/$line/d" $path
    fi
}

function append_to_buttom {
    path="$1"
    line="$2"
    prefix="$3"

    delete_line "$1" "$2" "$3"
    update_file "$1" "$2" "$3"
}
