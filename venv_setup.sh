#!/bin/sh
uv venv "${HOME}/BEN2"

. "${HOME}/BEN2/bin/activate"

uv pip install \
    "hydra-core" \
    "iopath" \
    "numpy" \
    "pillow" \
    "tqdm" \
    'ipython' \
    'jpeg4py' \
    'lmdb' \
    'loguru' \
    'matplotlib' \
    'opencv-python' \
    'pandas' \
    'scipy' \
    'tikzplotlib' \
    'ultralytics' \
;

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

mkdir -pv -- "${HOME}/MODEL_CHECKPOINTS/ULTRALYTICS/SAM2/"
cd "${HOME}/MODEL_CHECKPOINTS/ULTRALYTICS/SAM2/"

aria2c -c -x16 -j16 'https://github.com/ultralytics/assets/releases/download/v8.3.0/sam2.1_t.pt'
aria2c -c -x16 -j16 'https://github.com/ultralytics/assets/releases/download/v8.3.0/sam2.1_s.pt'
aria2c -c -x16 -j16 'https://github.com/ultralytics/assets/releases/download/v8.3.0/sam2.1_b.pt'
aria2c -c -x16 -j16 'https://github.com/ultralytics/assets/releases/download/v8.3.0/sam2.1_l.pt'
