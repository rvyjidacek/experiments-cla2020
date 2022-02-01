//
//  CompareAlgorithmsCoverage.swift
//  
//
//  Created by Roman Vyjídáček on 18/02/2020.
//

import Foundation
import FcaKit

public class CompareAlgorithmsCoverage {
    
    public func run() {
        let context = try! FormalContext(url: URL(fileURLWithPath: CommandLine.arguments[2]), format: .fimi)
        let dispatchGroup = DispatchGroup()
        var factors1: [FormalConcept] = []
        var factors2: [FormalConcept] = []
        let alg1 = GreCon()
        let alg2 = GreConD()
        
        dispatchGroup.enter()
        Thread.init {
            factors1 = alg1.countFactors(in: context)
            dispatchGroup.leave()
        }.start()
        
        dispatchGroup.enter()
        Thread.init {
            factors2 = alg2.countFactors(in: context)
            dispatchGroup.leave()
        }.start()

        dispatchGroup.wait()
        
        let iterationCount = min(factors1.count, factors2.count)
        let tuples: [(alg: BMFAlgorithm, factors: [FormalConcept])] = [(alg: alg1, factors: factors1), (alg: alg2, factors: factors2)]
        
        
        for tuple in tuples {
            let uncovered = CartesianProduct(context: context)
            
            print("\(tuple.alg.name)", separator: "", terminator: "")
            for i in 0..<iterationCount {
                let cover = tuple.factors[i].cartesianProduct.intersected(uncovered)
                print(",\(cover.count)", separator: "", terminator: "")
                
                for t in cover {
                    uncovered.remove(t)
                }
            }
            print("")
        }
    }
}
