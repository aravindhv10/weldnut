#!/bin/sh
unzip 'Weldnut.zip'

rm -vrf -- '__MACOSX'

mkdir jpeg mov

mv -vf 'Weldnut/IMG_0621 weldnut.jpeg' 'Weldnut/IMG_0628 weldnut.jpeg' 'Weldnut/IMG_0622 weldnut.jpeg' 'Weldnut/IMG_0623 weldnut.jpeg' 'Weldnut/IMG_0624 weldnut.jpeg' 'Weldnut/IMG_0625 weldnut.jpeg' 'Weldnut/IMG_0626 weldnut.jpeg' 'Weldnut/IMG_0627 weldnut.jpeg' 'jpeg'

mv -vf 'Weldnut/IMG_0629 weldnut.MOV' 'Weldnut/IMG_0631-14 weldnut scan.MOV' 'Weldnut/IMG_0632-14 weldnut scan.MOV' 'Weldnut/IMG_0633-12 weldnut scan.MOV' 'Weldnut/IMG_0630-14 weldnut scan.MOV' 'mov'

mkdir -pv -- png
convert './jpeg/IMG_0621 weldnut.jpeg' './png/IMG_0621 weldnut.png'
convert './jpeg/IMG_0625 weldnut.jpeg' './png/IMG_0625 weldnut.png'
convert './jpeg/IMG_0622 weldnut.jpeg' './png/IMG_0622 weldnut.png'
convert './jpeg/IMG_0626 weldnut.jpeg' './png/IMG_0626 weldnut.png'
convert './jpeg/IMG_0623 weldnut.jpeg' './png/IMG_0623 weldnut.png'
convert './jpeg/IMG_0627 weldnut.jpeg' './png/IMG_0627 weldnut.png'
convert './jpeg/IMG_0624 weldnut.jpeg' './png/IMG_0624 weldnut.png'
convert './jpeg/IMG_0628 weldnut.jpeg' './png/IMG_0628 weldnut.png'
