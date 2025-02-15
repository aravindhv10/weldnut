#!/bin/sh
unzip 'Weldnut.zip'

rm -vrf -- '__MACOSX'

mkdir jpeg mov

mv -vf 'Weldnut/IMG_0621 weldnut.jpeg' 'Weldnut/IMG_0628 weldnut.jpeg' 'Weldnut/IMG_0622 weldnut.jpeg' 'Weldnut/IMG_0623 weldnut.jpeg' 'Weldnut/IMG_0624 weldnut.jpeg' 'Weldnut/IMG_0625 weldnut.jpeg' 'Weldnut/IMG_0626 weldnut.jpeg' 'Weldnut/IMG_0627 weldnut.jpeg' 'jpeg'

mv -vf 'Weldnut/IMG_0629 weldnut.MOV' 'Weldnut/IMG_0631-14 weldnut scan.MOV' 'Weldnut/IMG_0632-14 weldnut scan.MOV' 'Weldnut/IMG_0633-12 weldnut scan.MOV' 'Weldnut/IMG_0630-14 weldnut scan.MOV' 'mov'




