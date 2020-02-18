# Experiments CLA 2020

This repozitory contains implementation of each experiment which was used for paper Revisiting the GreCon Algorithm for Boolean Matrix Factorization. Implementation of GreCon2 algorithm can be found on [https://github.com/rvyjidacek/FcaKit/blob/master/Sources/FcaKit/BMF/GreCon2.swift](https://github.com/rvyjidacek/FcaKit/blob/master/Sources/FcaKit/BMF/GreCon2.swift)

## Requirements

1. Swift version 5.1.4 or higher
2. Python version 3.8 or higher
3. Operating system: Linux or macOS

## Usage

Firstly you have to clone this repozitory to you computer:

```

    git clone https://github.com/rvyjidacek/experiments-cla2020.git

```

Then you have to launch bash script run.sh

```

    sh run.sh datasets
    
```
This script executes time benchmark and creates coverage graphs which can be found in the paper mentioned earlier. You can find result in a folder results.
