#!/bin/bash
cd /home/container || exit 1

# Configure colors
GREEN='\033[0;32m'
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "STARTUP /home/container: ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
echo " __   __       _        __  __        _ _              _ "
echo " \ \ / /__ _ _| |_ _  _|  \/  |___ __| (_)_____ ____ _| |"
echo "  \ V / -_) ' \  _| || | |\/| / -_) _\` | / -_) V / _\` | |"
echo "   \_/\___|_||_\__|\_, |_|  |_\___\__,_|_\___|\_/\__,_|_|"
echo "                   |__/                                  "
echo -e "========================================================================================================"
echo -e "${GREEN}The high council is now opening the gate! ${RESET_COLOR}"
echo -e "========================================================================================================"
eval ${MODIFIED_STARTUP}
