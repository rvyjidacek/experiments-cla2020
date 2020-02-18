#!/usr/bin/env python

## COVERAGE GRAPH

import matplotlib.pyplot as plt
import csv
import numpy as np
import sys

def y_axis_values(m):
    return list(map(lambda x: m * (x / 100), [0,10,20,30,40,50,60,70,80,90,100]))
        
    
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
    
    #plt.yticks(y_axis_values(y[len(y) - 1]), ["0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"])
    plt.tight_layout()
    #plt.legend(['GreCon', 'GreCon2', 'GreConD'], loc='lower right')
    plt.legend((scatters[0], scatters[1]), 
               labels,#('GreCon', 'GreConD'),
               loc='lower right')
    plt.savefig(output_file, format='eps')
    #plt.show()
    plt.close()

if sys.argv[1] == "GreCon":
    #generate_graph(5,5000,10,['s', 'x'],("GreCon", "GreConD"),directory.format('mushrooms.csv'), 'results/graphs/grecon-vs-grecond-coverage/mushrooms.eps')
    #generate_graph(30,2000,35,['s', 'x'],("GreCon", "GreConD"),directory.format('advertisment.csv'), 'results/graphs/grecon-vs-grecond-coverage/advertisment.eps')
    #generate_graph(10,5000,10,['s', 'x'],("GreCon", "GreConD"),directory.format('americas_small.csv'), 'results/graphs/grecon-vs-grecond-coverage/americas_small.eps')
    #generate_graph(20,500,20,['s', 'x'],("GreCon", "GreConD"),directory.format('apj.csv'), 'results/graphs/grecon-vs-grecond-coverage/apj.eps')
    #generate_graph(20,2000,10,['s', 'x'],("GreCon", "GreConD"),directory.format('customer.csv'), 'results/graphs/grecon-vs-grecond-coverage/customer.eps')
    #generate_graph(20,1000,30,['s', 'x'],("GreCon", "GreConD"),directory.format('dna.csv'), 'results/graphs/grecon-vs-grecond-coverage/dna.eps')
    generate_graph(2,1500,8,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2], 'firewall1-coverage.csv'), '{}{}'.format(sys.argv[3], 'firewall1.eps'))
    generate_graph(1,800,3,['s', 'x'],("GreCon", "GreConD"),'{}{}'.format(sys.argv[2], 'tic_tac_toe-coverage.csv'), '{}{}'.format(sys.argv[3], 'tic_tac_toe.eps'))
else:
    #generate_graph(5,5000,10,['>', 'x'],("GreCon2", "GreConD"),directory.format('mushrooms.csv'), 'results/graphs/grecon-vs-grecond-coverage/mushrooms.eps')
    #generate_graph(30,2000,35,['>', 'x'],("GreCon2", "GreConD"),directory.format('advertisment.csv'), 'results/graphs/grecon-vs-grecond-coverage/advertisment.eps')
    #generate_graph(10,5000,10,['>', 'x'],("GreCon2", "GreConD"),directory.format('americas_small.csv'), 'results/graphs/grecon-vs-grecond-coverage/americas_small.eps')
    #generate_graph(20,500,20,['>', 'x'],("GreCon2", "GreConD"),directory.format('apj.csv'), 'results/graphs/grecon-vs-grecond-coverage/apj.eps')
    #generate_graph(20,2000,10,['>', 'x'],("GreCon2", "GreConD"),directory.format('customer.csv'), 'results/graphs/grecon-vs-grecond-coverage/customer.eps')
    #generate_graph(20,1000,30,['>', 'x'],("GreCon2", "GreConD"),directory.format('dna.csv'), 'results/graphs/grecon-vs-grecond-coverage/dna.eps')
    generate_graph(2,1500,8,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2], 'firewall1-coverage.csv'), '{}{}'.format(sys.argv[3], 'firewall1.eps'))
    generate_graph(1,800,3,['>', 'x'],("GreCon2", "GreConD"),'{}{}'.format(sys.argv[2], 'tic_tac_toe-coverage.csv'), '{}{}'.format(sys.argv[3], 'tic_tac_toe.eps'))
