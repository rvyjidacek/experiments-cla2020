//
//  Benchmark.swift
//  
//
//  Created by Roman Vyjídáček on 18/02/2020.
//

import Foundation

public class Benchmark {
    public let path = CommandLine.arguments[2]
    
    public let group = DispatchGroup()
    public let printMutex = DispatchSemaphore(value: 1)
    public let dispatchQueue = DispatchQueue(label: "cz.upol.bmf",
                                             qos: .default,
                                             attributes: .concurrent,
                                             autoreleaseFrequency: .workItem,
                                             target: nil)
    public let urls: [URL]
    
    init() throws {
        urls = try FileManager.default.contentsOfDirectory(at: URL(string: path)!,
                                                           includingPropertiesForKeys: nil,
                                                           options: [.skipsHiddenFiles]).filter { $0.absoluteString.contains(".csv") }
    }
    
    public func run() {
        fatalError("Call run function on instance of Benchmark is forbidden. Create subclass of the class Benchmark.")
    }
}
