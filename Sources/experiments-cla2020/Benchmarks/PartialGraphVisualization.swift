//
//  PartialGraphVisualization.swift
//  
//
//  Created by Roman Vyjídáček on 18/02/2020.
//

import Foundation
import FcaKit

public class PartialGraphVisualization {
        
    public func run() {
        let url = URL(fileURLWithPath: CommandLine.arguments[2])
        let context = try! FormalContext(url: url)
        
        let algorithm2 = GreCon2()
        let concepts = [FormalConcept](context.attributeConcepts.union(context.objectConcepts))
        let factors2 = algorithm2.countFactorization(using: concepts, in: context)
        var totalCoverage2 = 0
        let contextRelation2 = CartesianProduct(context: context)
        let covered2 = CartesianProduct(rows: context.objectCount,
                                       cols: context.attributeCount)
        
        print("\(algorithm2.name);0", separator: "", terminator: "")
        for factor in factors2 {
            covered2.union(factor.cartesianProduct)
            totalCoverage2 = covered2.intersected(contextRelation2).count
            print(";\(totalCoverage2)", separator: "", terminator: "")
        }
        print("")
        
        let algorithm1 = GreConD()
        let factors = algorithm1.countFactors(in: context)
        var totalCoverage = 0
        let contextRelation = CartesianProduct(context: context)
        let covered = CartesianProduct(rows: context.objectCount,
                                       cols: context.attributeCount)
        
        print("\(algorithm1.name);0", separator: "", terminator: "")
        for factor in factors {
            covered.union(factor.cartesianProduct)
            totalCoverage = covered.intersected(contextRelation).count
            print(";\(totalCoverage)", separator: "", terminator: "")
        }
        print("")
    }
}
