//
//  Measure.swift
//  
//
//  Created by Roman Vyjídáček on 01.02.2022.
//

import Foundation
import FcaKit

#if os(Linux)
    public typealias CFAbsoluteTime = Double
#endif

public typealias MeasureResult<T> = (averageTime: CFAbsoluteTime,
                              bestTime: CFAbsoluteTime,
                              worstTime: CFAbsoluteTime,
                              deviation: CFAbsoluteTime,
                              closureResult: T)

public func measure<T>(times: UInt = 1, closure: () -> T) -> MeasureResult<T> {
    let timer = Timer()
    var result: T!
    var executionTimes: [CFAbsoluteTime] = []
    
    for _ in 0..<times {
        timer.start()
        result = closure()
        executionTimes.append(timer.stop())
    }
    
    let averageTime = executionTimes.reduce(0, +) / Double(times)
    let bestTime = executionTimes.min()!
    let worstTime = executionTimes.max()!
    let deviation = executionTimes.map({ (averageTime - $0).magnitude }).reduce(0, +) / Double(executionTimes.count)
    
    return (averageTime, bestTime, worstTime, deviation, result)
}
