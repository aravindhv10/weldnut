#!/bin/sh
mkdir -pv -- jpeg mov
mv -vf -- 'Weldnut/IMG_0621 weldnut.jpeg' 'Weldnut/IMG_0628 weldnut.jpeg' 'Weldnut/IMG_0622 weldnut.jpeg' 'Weldnut/IMG_0623 weldnut.jpeg' 'Weldnut/IMG_0624 weldnut.jpeg' 'Weldnut/IMG_0625 weldnut.jpeg' 'Weldnut/IMG_0626 weldnut.jpeg' 'Weldnut/IMG_0627 weldnut.jpeg' 'jpeg'
mv -vf -- 'Weldnut/IMG_0629 weldnut.MOV' 'Weldnut/IMG_0631-14 weldnut scan.MOV' 'Weldnut/IMG_0632-14 weldnut scan.MOV' 'Weldnut/IMG_0633-12 weldnut scan.MOV' 'Weldnut/IMG_0630-14 weldnut scan.MOV' 'mov'

mkdir -pv -- png
convert './jpeg/IMG_0621 weldnut.jpeg' './png/IMG_0621 weldnut.png'
convert './jpeg/IMG_0625 weldnut.jpeg' './png/IMG_0625 weldnut.png'
convert './jpeg/IMG_0622 weldnut.jpeg' './png/IMG_0622 weldnut.png'
convert './jpeg/IMG_0626 weldnut.jpeg' './png/IMG_0626 weldnut.png'
convert './jpeg/IMG_0623 weldnut.jpeg' './png/IMG_0623 weldnut.png'
convert './jpeg/IMG_0627 weldnut.jpeg' './png/IMG_0627 weldnut.png'
convert './jpeg/IMG_0624 weldnut.jpeg' './png/IMG_0624 weldnut.png'
convert './jpeg/IMG_0628 weldnut.jpeg' './png/IMG_0628 weldnut.png'

W(){
    ffmpeg -i "mov/${1}.MOV" "mp4/${1}.mp4" -c:v libx264
}

W 'IMG_0629 weldnut'
W 'IMG_0630-14 weldnut scan'
W 'IMG_0631-14 weldnut scan'
W 'IMG_0632-14 weldnut scan'
W 'IMG_0633-12 weldnut scan'

W(){
    mkdir -pv -- "mp4/${1}.dir"
    ffmpeg -i "mp4/${1}.mp4" -r 1 "mp4/${1}.dir/%d.png" 
}

W 'IMG_0629 weldnut'
W 'IMG_0630-14 weldnut scan'
W 'IMG_0631-14 weldnut scan'
W 'IMG_0632-14 weldnut scan'
W 'IMG_0633-12 weldnut scan'
