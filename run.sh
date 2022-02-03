#!/bin/bash

mkdir -p results

printf "%s\n" "Running time benchmark"

swift run -c release experiments-cla2020 -t "$1" > "results/time-results.tex"

printf "%s\n" "Compare coverage of GreCon and GreConD"
for file in $(ls $1)
do

    filename="$file"
    filename=$(echo $filename | sed 's/.fimi//')
    
    mkdir -p 'results/Grecon-vs-Grecond'
    swift run -c release experiments-cla2020 -m "$1/${file}" > "results/Grecon-vs-Grecond/${filename}-coverage.csv"
done

mkdir -p "results/graphs/grecon-vs-grecond"

printf "%s\n" "Generating graphs"
chmod u+x 'generate-graph.py'

./generate-graph.py 'results/Grecon-vs-Grecond/'

# GENERATE GRAPHS GRECON VS GRECOND COVERAGE

printf "%s\n" "Coverage graphs of GreCon and GreConD"
for file in $(ls $1)
do

    filename="$file"
    filename=$(echo $filename | sed 's/.fimi//')
    
    mkdir -p 'results/Grecon-vs-Grecond-Coverage'
    swift run -c release experiments-cla2020 -g1 "$1/${file}" > "results/Grecon-vs-Grecond-Coverage/${filename}-coverage.csv"
done

mkdir -p "results/graphs/grecon-vs-grecond-coverage"
chmod u+x coverage-graph.py

./coverage-graph.py 'GreCon' 'results/Grecon-vs-Grecond-Coverage/' "results/graphs/grecon-vs-grecond-coverage/"

# GENERATE GRAPHS GRECON2 VS GRECOND COVERAGE

printf "%s\n" "Coverage graphs of GreCon2 and GreConD"
for file in $(ls $1)
do

    filename="$file"
    filename=$(echo $filename | sed 's/.fimi//')
    
    mkdir -p 'results/Grecon2-vs-Grecond-Coverage'
    swift run -c release experiments-cla2020 -g1 "$1/${file}" > "results/Grecon2-vs-Grecond-Coverage/${filename}-coverage.csv"
done

mkdir -p "results/graphs/grecon2-vs-grecond-coverage"
chmod u+x coverage-graph.py

./coverage-graph.py 'GreCon2' 'results/Grecon2-vs-Grecond-Coverage/' "results/graphs/grecon2-vs-grecond-coverage/"


#GRECON2 FACTORIZATION ON A(I) and O(I)

printf "%s\n" "Coverage graphs of GreCon2 on A(I) and O(I) and GreConD"
for file in $(ls $1)
do

    filename="$file"
    filename=$(echo $filename | sed 's/.fimi//')
    
    mkdir -p 'results/restricted-grecon2-factorization'
    swift run -c release experiments-cla2020 -pg "$1/${file}" > "results/restricted-grecon2-factorization/${filename}-coverage.csv"
done

mkdir -p 'results/graphs/restricted-grecon2-factorization'
chmod u+x coverage-graph.py

./coverage-graph.py 'GreCon2' 'results/restricted-grecon2-factorization/' 'results/graphs/restricted-grecon2-factorization/'

exit 0
