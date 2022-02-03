#!/usr/bin/env python

## GRECON vs GRECOND

import sys
import matplotlib.pyplot as plt
import csv
import numpy as np

def generate_graph(axis_min, axis_max, input_file, output_file):
    x = np.linspace(0, axis_max, 100)
    plt.plot(x, x, linestyle='dashed', color='gray', zorder=0)
    
    with open(input_file, 'r') as csvfile:
        plots = csv.reader(csvfile, delimiter=',')
        rows = []
        x=[]
        y=[]

        for row in plots:
            rows.append(row)

        for j in range(1, len(row)):
            y.append(float(rows[0][j]))
            x.append(float(rows[1][j]))
        
        plt.scatter(x, y, s=20, facecolors='none', edgecolors='black')

    plt.xlabel('GreCon')
    plt.ylabel('GreConD')
    plt.yscale("log")
    plt.xscale("log")
    plt.margins(0)
    plt.ylim(axis_min, axis_max)
    plt.xlim(axis_min, axis_max)
    plt.tight_layout()
    plt.savefig(output_file, format='eps')
    plt.close()

    
folder = sys.argv[1]

# Firewall 1
generate_graph(0.5, 90000, '{}firewall1-coverage.csv'.format(folder), 'results/graphs/grecon-vs-grecond/firewall1.eps')

# Mushrooms
generate_graph(1, 40000, "{}mushrooms-coverage.csv".format(folder), 'results/graphs/grecon-vs-grecond/mushrooms.eps')

# Americas small
generate_graph(0.5, 300000, '{}americas_small-coverage.csv'.format(folder), 'results/graphs/grecon-vs-grecond/americas-small.eps')

# Apj
generate_graph(0.5, 2000, '{}apj-coverage.csv'.format(folder), 'results/graphs/grecon-vs-grecond/apj.eps')

# Advertisment
generate_graph(0.5, 20000, '{}advertisement-coverage.csv'.format(folder), 'results/graphs/grecon-vs-grecond/advertisment.eps')

# Customer
generate_graph(0.5, 10000, '{}customer-coverage.csv'.format(folder), 'results/graphs/grecon-vs-grecond/customer.eps')

# DNA
generate_graph(0.5, 10000, '{}dna-coverage.csv'.format(folder), 'results/graphs/grecon-vs-grecond/dna.eps')

# Tic tac toe
generate_graph(100, 1000, '{}tic_tac_toe-coverage.csv'.format(folder), 'results/graphs/grecon-vs-grecond/tic_tac_toe.eps')
