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

public func timeBenchmark() throws {
    let fileContent += "\\begin{tabular}{|l|c|c|c|}\n\\hline\n"
    fileContent += "Dataset & GreCon & GreCon2 & GreConD \\\\ \n \\hline\n"
    
    for url in urls {
        if url.isFileURL {
            let context = try! FormalContext(url: url, format: .fimi)
            var times: [[Double]] = [[], [], []]
            var algIndex = 0
            let algs = [GreCon(), GreCon2(), GreConD()]
            
            for algorithm in algs {
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
                fileContent += " & $\(String(format: "%.2f", average.rounded(toPlaces: 2))) \\pm \(String(format: "%.2f", deviation.rounded(toPlaces: 2)))$ "
            }
            fileContent += "\\\\ \\hline\n"
            
        }
    }
    
    fileContent += "\\end{tabular}\n"
    try FileManager.default.saveResult(folder: "Time", filename: "times.tex", content: fileContent)
}
