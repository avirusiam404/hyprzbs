#!/bin/bash

SCRIPTSPATH=URSCRIPTSPATH # this files path + dont use / at the end

source $SCRIPTSPATH/.venv/bin/activate
$SCRIPTSPATH/.venv/bin/python3 $SCRIPTSPATH/mediaplayer.py --player spotify
