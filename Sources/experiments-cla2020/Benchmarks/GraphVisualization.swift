//
//  GraphVisualization.swift
//  
//
//  Created by Roman Vyjídáček on 18/02/2020.
//

import Foundation
import FcaKit

public class GraphVisualization: Benchmark {
    
    public override func run() {
        for url in urls {
            if url.isFileURL {
                print("### Dataset \(url.lastPathComponent)")
                let context = try! FormalContext(url: url)
                
                for algorithm in [GreCon2()] {
                    let concepts = [FormalConcept](context.attributeConcepts.union(context.objectConcepts))
                    let factors = algorithm.countFactorization(using: concepts, in: context)
                    
                    var totalCoverage = 0
                    let contextRelation = CartesianProduct(context: context)
                    let covered = CartesianProduct(rows: context.objectCount,
                                                   cols: context.attributeCount)
                    
                    print("\(algorithm.name);0", separator: "", terminator: "")
                    for factor in factors {
                        covered.union(factor.cartesianProduct)
                        totalCoverage = covered.intersected(contextRelation).count
                        //print("\(1.0 - (Float(totalCoverage) / Float(contextRelation.count)))".replacingOccurrences(of: ".", with: ","))
                        print(";\(totalCoverage)", separator: "", terminator: "")
                    }
                    print("")
                }
            }
        }
    }
}
