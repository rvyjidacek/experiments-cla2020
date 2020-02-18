//
//  TimeBenchmark.swift
//  
//
//  Created by Roman Vyjídáček on 18/02/2020.
//

import Foundation
import FcaKit
    
public class TimeBenchmark: Benchmark {
    
    public override func run() {
        print("\\begin{tabular}{|l|c|c|c|}\n\\hline")
        print("Dataset & GreCon & GreCon2 & GreConD \\\\ \n \\hline")
        
        for url in urls {
            if url.isFileURL {
                let context = try! FormalContext(url: url)
                var times: [[Double]] = [[], [], []]
                var algIndex = 0
                let algs = [GreCon(), GreCon2(), GreConD()]
                
                for algorithm in algs {
                    print(algorithm.name)
                    for _ in 0..<5 {
                        let timer = Timer()
                        let _ = algorithm.countFactors(in: context)
                        let time = timer.stop()
                        times[algIndex].append(time)
                    }
                    algIndex += 1
                }
                
                
                for col in 0..<times.count {
                    let average = times[col].reduce(0, +) / Double(times[col].count)
                    let deviation = times[col].map({ (average - $0).magnitude }).reduce(0, +) / Double(times[col].count)
                    print(" & $\(String(format: "%.2f", average.rounded(toPlaces: 2))) \\pm \(String(format: "%.2f", deviation.rounded(toPlaces: 2)))$ ", separator: "", terminator: "")
                }
                print("\\\\ \\hline")
                
            }
        }
        
        print("\\end{tabular}")
    }
    
}

