//
//  PartialFactorization.swift
//  
//
//  Created by Roman Vyjídáček on 18/02/2020.
//

import Foundation
import FcaKit

public class PartialFactorization: Benchmark {
    
    public override func run() {
        print("\\begin{tabular}{|l|c|c|c|}\n\\hline")
        print("Dataset & Time & \\# Factors & \\| O(I) and A(I) \\| \\\\ \n \\hline")
        
        for url in urls {
            if url.isFileURL {
                let context = try! FormalContext(url: url)
                let concepts = [FormalConcept](context.attributeConcepts.union(context.objectConcepts))
                var times: [Double] = []
                var factors: [FormalConcept] = []
                
                
                for _ in 0..<5 {
                    let timer = Timer()
                    factors = GreCon2().countFactorization(using: concepts, in: context) as! [FormalConcept]
                    let time = timer.stop()
                    times.append(time)
                }
                
                let average = times.reduce(0, +) / Double(times.count)
                let deviation = times.map({ (average - $0).magnitude }).reduce(0, +) / Double(times.count)
                print("\(url.lastPathComponent) & $\(String(format: "%.2f", average.rounded(toPlaces: 2))) \\pm \(String(format: "%.2f", deviation.rounded(toPlaces: 2)))$ \(factors.count) \(concepts.count)")
                print("\\\\ \\hline")
            }
        }
        print("\\end{tabular}")
    }
}
