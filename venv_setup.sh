#!/bin/sh
uv venv "${HOME}/BEN2"
. "${HOME}/BEN2/bin/activate"
uv pip install \
    'torch' \
    'torchvision' \
    'torchaudio' \
    '--index-url' 'https://download.pytorch.org/whl/cpu' \
;
