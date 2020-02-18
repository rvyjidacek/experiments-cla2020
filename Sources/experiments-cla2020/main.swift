import Foundation
import FcaKit

if CommandLine.argc < 3 {
    print("Usage: swift run -c release experiments-cla2020 option /path/to/datasets/folder")
    print("Options:")
    print("  -t: Time bechnmark")
    print("  -c: Compare coverage GreCon vs GreConD")
    exit(1)
}

let option = CommandLine.arguments[1]
var benchmark: Benchmark

do {
    switch option {
    case "-t":
        benchmark = try TimeBenchmark()
    case "-c":
        CompareAlgorithmsCoverage().run()
        exit(0)
    case "-g":
        benchmark = try GraphVisualization()
    default:
        print("Unknown option \(option)")
        exit(1)
    }
    
    benchmark.run()
} catch {
    print(error.localizedDescription)
    exit(1)
}
