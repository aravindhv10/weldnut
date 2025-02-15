#!/bin/sh
uv venv "${HOME}/BEN2"

. "${HOME}/BEN2/bin/activate"

uv pip install \
    'torch' \
    'torchvision' \
    'torchaudio' \
    '--index-url' 'https://download.pytorch.org/whl/cpu' \
;

get_repo(){
    DIR_REPO="${HOME}/GITHUB/$('echo' "${1}" | 'sed' 's/^git@github.com://g ; s@^https://github.com/@@g ; s@.git$@@g' )"
    DIR_BASE="$('dirname' '--' "${DIR_REPO}")"

    mkdir -pv -- "${DIR_BASE}"
    cd "${DIR_BASE}"
    git clone "${1}"
    cd "${DIR_REPO}"

    if test "${#}" '-ge' '2'
    then
        git switch "${2}"
    else
        git switch main
    fi

    git pull
    git submodule update --recursive --init

    if test "${#}" '-ge' '3'
    then
        git checkout "${3}"
    fi
}

get_repo 'https://github.com/PramaLLC/BEN2.git'
uv pip install .
