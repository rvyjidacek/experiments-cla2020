//
//  GraphVisualization.swift
//  
//
//  Created by Roman Vyjídáček on 18/02/2020.
//

import Foundation
import FcaKit

public class GraphVisualization {
    
    var algorithms: [BMFAlgorithm] = []
    
    public func run() {
        let url = URL(fileURLWithPath: CommandLine.arguments[2])
        let context = try! FormalContext(url: url)
        
        for algorithm in algorithms {
            let factors = algorithm.countFactors(in: context)
            var totalCoverage = 0
            let contextRelation = CartesianProduct(context: context)
            let covered = CartesianProduct(rows: context.objectCount,
                                           cols: context.attributeCount)
        
            print("\(algorithm.name);0", separator: "", terminator: "")
            for factor in factors {
                covered.union(factor.cartesianProduct)
                totalCoverage = covered.intersected(contextRelation).count
                print(";\(totalCoverage)", separator: "", terminator: "")
            }
            print("")
        }
    }
}


