#!/bin/bash

mkdir -p results

swift run -c release experiments-cla2020 -t ~/PhD/datasets/grecon2.0/ > results/time-results.tex

exit 0
