#!/usr/bin/python3
from PIL import Image
from ben2 import BEN_Base
import cv2
import numpy as np
import os
import torch


device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model = BEN_Base.from_pretrained("PramaLLC/BEN2")
model.to(device).eval()


def process_segment(img):
    return (img[:, :, 3] > 127).astype(np.uint8)


def do_infer(image_PIL_input):
    foreground_PIL_output = model.inference(
        image_PIL_input,
        refine_foreground=False,
    )  # Refine foreground is an extract postprocessing step that increases inference time but can improve matting edges. The default value is False.
    return foreground_PIL_output


def write_mask(path_file_image_input, path_file_mask_output):
    do_infer(image_PIL_input=Image.open(path_file_image_input)).save(
        path_file_mask_output
    )
    cv2.imwrite(
        path_file_mask_output,
        process_segment(img=cv2.imread(path_file_mask_output, cv2.IMREAD_UNCHANGED)),
    )


def get_bbox(path_file_mask_input):
    mask_input = cv2.imread(path_file_mask_input, cv2.IMREAD_GRAYSCALE)
    rows = np.any(mask_input, axis=1)
    cols = np.any(mask_input, axis=0)
    r = np.where(rows)[0]
    c = np.where(cols)[0]

    if (r.flatten().shape[0] > 0) and (c.flatten().shape[0] > 0):
        rmin, rmax = r[[0, -1]]
        cmin, cmax = c[[0, -1]]
        return rmin.item(), cmin.item(), rmax.item(), cmax.item()
    else:
        return 0, 0, mask_input.shape[0] - 1, mask_input.shape[1] - 1


def image_2_bbox(path_prefix_input):
    write_mask(
        path_file_image_input=path_prefix_input + ".png",
        path_file_mask_output=path_prefix_input + "_M.png",
    )
    res = get_bbox(path_file_mask_input=path_prefix_input + "_M.png")
    print(res)


image_2_bbox(path_prefix_input="./mp4/IMG_0629 weldnut.dir/1")
