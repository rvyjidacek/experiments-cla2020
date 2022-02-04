# Experiments CLA 2020

The repository contains an implementation of all experiments that presented in paper Revisiting the GreCon Algorithm for Boolean Matrix Factorization submitted to CLA 2020. Implementation of the GreCon2 algorithm can be found on [https://github.com/rvyjidacek/FcaKit/blob/master/Sources/FcaKit/BMF/GreCon2.swift](https://github.com/rvyjidacek/FcaKit/blob/master/Sources/FcaKit/BMF/GreCon2.swift)

## Requirements

1. Swift version 5.1.4 or higher
2. Python version 3.8 or higher
3. Operating system: Linux or macOS

## Usage

First, you have to clone this repository to your computer:

```

    git clone https://github.com/rvyjidacek/experiments-cla2020.git

```

Then run the bash script run.sh


```

    sh run.sh datasets
    
```
The script executes a time benchmark and plots the graphs that can be found in the paper. Already computed results can be found in directory results.
