#!/usr/bin/bash

NC="\033[0m"
RED="\033[0;31m"
GREEN="\033[0;32m"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function title()
{
    echo -e "${RED}----- ${1} -----${NC}"
}

function checkmark()
{
    echo -e " ${GREEN}✓${NC}"
}

function setup_bat()
{
    title "Bat"

    echo -n "Creating folders..."
    mkdir -p ~/.config/bat/themes
    checkmark

    echo -n "Symlinking config..."
    ln -s "${DIR}/bat/config" ~/.config/bat/
    checkmark

    echo -n "Symlinking themes..."
    ln -s "${DIR}/bat/themes/Dracula.tmTheme" ~/.config/bat/themes/
    checkmark

    echo -n "Building cache..."
    bat cache --build 1>/dev/null
    checkmark
}

setup_bat
