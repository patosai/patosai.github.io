set encoding utf8

set terminal svg size 500,500 font "Source Sans,16"
set output 'eulers-formula.svg'

set object circle at 0,0 size 1

set arrow from -1.1,0 to 1.2,0
set label 'Re' at 1.1,-0.1 center

set arrow from 0,-1.1 to 0,1.2
set label 'Im' at 0.1,1.1 center

set object circle at 0,0 size 0.1 arc [0:60]
set label 'θ' at 0.15,0.1 center

set arrow from 0,0 to 0.5,sqrt(3)/2 nohead lc rgb 'orange'

set arrow from 0,0 to 0.5,0 nohead lc rgb 'green'
set label 'cos(θ)' at 0.25,-0.1 center

set arrow from 0.5,0 to 0.5,sqrt(3)/2 nohead lc rgb 'green'
set label 'sin(θ)' at 0.55,sqrt(3)/4 left

set xrange [-1.2:1.2]
set yrange [-1.2:1.2]
set size square

unset border
unset xtics
unset ytics

# plot something out of range
plot 100 title ""
