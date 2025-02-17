#!/bin/sh
. "${HOME}/BEN2/bin/activate"
VIDEO_FILE="$(realpath "${1}")"
TEXT_BBOX_FILE="$(realpath "${2}")"
cd "${HOME}/GITHUB/yangchris11/samurai"
python3 "${HOME}/GITHUB/yangchris11/samurai/scripts/demo_cpu.py" \
    --video_path "${VIDEO_FILE}" \
    --txt_path "${TEXT_BBOX_FILE}" \
;
