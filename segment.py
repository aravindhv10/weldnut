#!/usr/bin/python3
from ben2 import BEN_Base
from PIL import Image
import torch
import os

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
