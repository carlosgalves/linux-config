# progress.sh

show_progress() {
    local current=$1
    local total=$2
    local progress_percent=$((current * 100 / total))
    printf "\r\033[34mProgress %d/%d [\033[36m%-20s\033[34m] %d%%\033[0m\n" "$current" "$total" $(printf '#%.0s' $(seq 1 $((progress_percent / 5)))) "$progress_percent"
}