#!/bin/bash
pkill -USR1 -x sxhkd
pkill picom
pkill bspwm

sleep 0.5

sxhkd &
picom &
