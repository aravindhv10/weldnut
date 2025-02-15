#!/usr/bin/python3
from PIL import Image
from ben2 import BEN_Base
import cv2
import numpy as np
import os
import torch

os.makedirs(name='./mask/',  exist_ok=True)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model = BEN_Base.from_pretrained("PramaLLC/BEN2")
model.to(device).eval()

def slave(name):
    image = Image.open("./png/" + name)
    foreground = model.inference(
        image,
        refine_foreground=False,
    )  # Refine foreground is an extract postprocessing step that increases inference time but can improve matting edges. The default value is False.

    foreground.save("./mask/" + name)

for i in os.listdir("./png/"):
    slave(name=i)

def process_segment(img):
    return (img[:, :, 3] > 127).astype(np.uint8)

def visualize(name):
    orig = cv2.imread("./png/" + name, cv2.IMREAD_COLOR)
    segm = cv2.imread("./mask/" + name, cv2.IMREAD_UNCHANGED)
    segm = process_segment(segm)
    masked = orig.copy()
    for i in range(3):
        masked[:, :, i] = orig[:, :, i] * segm
    final_array = np.array([orig, masked]).reshape((orig.shape[0]*2, orig.shape[1], 3))
    print(final_array.shape)

    os.makedirs(name="./vis/", exist_ok=True)
    cv2.imwrite("./vis/" + name, final_array)


for i in os.listdir("./png/"):
    visualize(i)

def grow_mask(name):
    segm = cv2.imread("./mask/" + name, cv2.IMREAD_UNCHANGED)
    segm = process_segment(segm) * 255
    kernel1 = np.array(
        [
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
        ]
    )
    segm = cv2.filter2D(src=segm, ddepth=-1, kernel=kernel1)
    cv2.imwrite("./mask/B_" + name, segm)


for i in os.listdir("./png/"):
    grow_mask(i)
