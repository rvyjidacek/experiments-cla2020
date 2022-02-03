//
//  Benchmarks.swift
//  
//
//  Created by Roman Vyjídáček on 01.02.2022.
//

import Foundation
import FcaKit

public func compareGreConAndGreConDCoverage() throws {
    
    for url in try FileManager.getUrls() {
        let context = try FormalContext(url: url)
        let dispatchGroup = DispatchGroup()
        var factors1: [FormalConcept] = []
        var factors2: [FormalConcept] = []
        let alg1 = GreCon()
        let alg2 = GreConD()
        
        factors1 = alg1.countFactors(in: context)
        dispatchGroup.leave()
        
        factors2 = alg2.countFactors(in: context)
        dispatchGroup.leave()
        
        let iterationCount = min(factors1.count, factors2.count)
        let tuples: [(alg: BMFAlgorithm, factors: [FormalConcept])] = [(alg: alg1, factors: factors1), (alg: alg2, factors: factors2)]
        
        var fileContent = ""
        
        for tuple in tuples {
            let uncovered = CartesianProduct(context: context)
            
            fileContent += "\(tuple.alg.name)"
            for i in 0..<iterationCount {
                let cover = tuple.factors[i].cartesianProduct.intersected(uncovered)
                fileContent += ",\(cover.count)"
                
                for t in cover {
                    uncovered.remove(t)
                }
            }
            fileContent += "\n"
        }
        let dataset = url.lastPathComponent.replacingOccurrences(of: ".fimi", with: "")
        
        try FileManager.default.saveResult(folder: "Grecon_GreConD_coverage_cmp",
                                           filename: dataset + ".csv",
                                           content: fileContent)
    }
}
