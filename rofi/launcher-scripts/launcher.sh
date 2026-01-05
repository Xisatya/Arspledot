#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x

##Modified by Xisatya (FORK)

dir="$HOME/.config/rofi/style"
theme='launcher-style'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
