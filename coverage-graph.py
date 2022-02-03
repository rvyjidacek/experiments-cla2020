#!/usr/bin/env python

## COVERAGE GRAPH

import matplotlib.pyplot as plt
import csv
import numpy as np
import sys
    
def generate_graph(x_padding, y_padding, step, markers, labels, input_file, output_file):
    rows = []
        
    with open(input_file, 'r') as csvfile:
        plots = csv.reader(csvfile, delimiter=';')
        
        for row in plots:
           rows.append(list(filter(lambda x: x != "", row)))

    x=[]
    y=[]
    index = 0
    scatters = []
    
    fig, lines = plt.subplots()
    
    for row in rows:
        x = []
        y = []
        
        row_max = float(row[-2] if row[-1] == "" else row[-1])

        for j in range(2, len(row) - 1, step):
            y.append(float(row[j]) / row_max)
            x.append(float(j - 1))
        
        scatters.append(plt.scatter(x, y, marker=markers[index], 
                                    color='black'))
        
        x = []
        y = []
        
        for j in range(1, len(row) - 1):
            y.append(float(row[j]) / row_max)
            x.append(float(j - 1))
        
        plt.plot(x, y, marker="", color='black', linewidth=0.5)
        index += 1

    plt.xlabel('Number of Factors')
    plt.ylabel('Coverage')
    
    plt.ylim(0, 1.1)
    plt.xlim(0, len(rows[0]) + x_padding)
    
    plt.tight_layout()
    plt.legend((scatters[0], scatters[1]), 
               labels,
               loc='lower right')
    plt.savefig(output_file, format='eps')
    plt.close()

if sys.argv[1] == "GreCon":
    generate_graph(2,1500,8,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2], 'firewall1-coverage.csv'), '{}{}'.format(sys.argv[3], 'firewall1.eps'))
    generate_graph(5,5000,10,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2],'mushrooms-coverage.csv'), '{}{}'.format(sys.argv[3], 'mushrooms.eps'))
    generate_graph(30,2000,35,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2],'advertisment-coverage.csv'), '{}{}'.format(sys.argv[3], 'advertisment.eps'))
    generate_graph(10,5000,10,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2],'americas_small-coverage.csv'), '{}{}'.format(sys.argv[3], 'americas_small.eps'))
    generate_graph(20,500,20,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2],'apj-coverage.csv'), '{}{}'.format(sys.argv[3], 'apj.eps'))
    generate_graph(20,2000,10,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2],'customer-coverage.csv'), '{}{}'.format(sys.argv[3], 'customer.eps'))
    generate_graph(20,1000,30,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2],'dna-coverage.csv'), '{}{}'.format(sys.argv[3], 'dna.eps'))
    generate_graph(1,800,3,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2], 'tic_tac_toe-coverage.csv'), '{}{}'.format(sys.argv[3], 'tic_tac_toe.eps'))
else:
    generate_graph(2,1500,8,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2], 'firewall1-coverage.csv'), '{}{}'.format(sys.argv[3], 'firewall1.eps'))
    generate_graph(5,5000,10,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2],'mushrooms-coverage.csv'), '{}{}'.format(sys.argv[3], 'mushrooms.eps'))
    generate_graph(30,2000,35,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2],'advertisment-coverage.csv'), '{}{}'.format(sys.argv[3], 'advertisment.eps'))
    generate_graph(10,5000,10,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2],'americas_small-coverage.csv'), '{}{}'.format(sys.argv[3], 'americas_small.eps'))
    generate_graph(20,500,20,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2],'apj-coverage.csv'), '{}{}'.format(sys.argv[3], 'apj.eps'))
    generate_graph(20,2000,10,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2],'customer-coverage.csv'), '{}{}'.format(sys.argv[3], 'customer.eps'))
    generate_graph(20,1000,30,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2],'dna-coverage.csv'), '{}{}'.format(sys.argv[3], 'dna.eps'))
    generate_graph(1,800,3,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2], 'tic_tac_toe-coverage.csv'), '{}{}'.format(sys.argv[3], 'tic_tac_toe.eps'))
