#!/bin/bash

log_file="log.json"

check_installation() {
    local app_name=$1
    local installed_version=$2
    local latest_release_url=$3

    if [ $? -eq 0 ]; then
        echo "{\"name\": \"$app_name\", \"status\": \"SUCCESS\", \"installed_version\": \"$installed_version\", \"latest_release\": \"$latest_release\"}" >> "$log_file"
        return 0  # Exit the function with success status
    else
        echo "{\"name\": \"$app_name\", \"status\": \"FAILURE\"}" >> "$log_file"
        return 1  # Exit the function with failure status
    fi
}