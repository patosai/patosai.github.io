set encoding utf8
set terminal svg size 400,250 font "Source Sans,16"
set output 'aliasing.svg'

set xrange [0:3*pi]
set xtics ("0" 0,"0.5π" pi/2, "π" pi, "1.5π" 1.5*pi, "2π" 2*pi, "2.5π" 2.5*pi, "3π" 3*pi)
unset ytics
unset border

$sampling_1 << EOD
0 1
3.14 -1
6.28 1
9.42 -1
EOD

$sampling_2 << EOD
1.59 0
4.71 0
7.87 0
10.99 0
EOD

set style line 1 \
    linecolor rgb '#0060ad' \
    pointtype 7 pointsize 1

set style line 2 \
    linecolor rgb '#ff0000' \
    pointtype 5 pointsize 1

plot 0 title "",cos(x) title "", "$sampling_1" title "Sample 1" linestyle 1, "$sampling_2" title "Sample 2" linestyle 2
