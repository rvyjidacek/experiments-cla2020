//import Foundation
//import FcaKit
//
//if CommandLine.argc < 3 {
//    print("Usage: swift run -c release experiments-cla2020 option /path/to/datasets/folder")
//    print("Options:")
//    print("  -t: Time bechnmark")
//    print("  -m: Compare coverage GreCon vs GreConD")
//    print("  -g1: Computes coverage for GreCon and GreConD")
//    print("  -g2: Computes coverage for GreCon2 and GreConD")
//    print("  -p: Computes factorization for GreCon2 on A(I) and O(I)")
//    print("  -pg: Computes coverage of GreCon2 on O(I) and A(I) vs GreConD")
//    exit(1)
//}
//
//let option = CommandLine.arguments[1]
//var benchmark: Benchmark
//
//do {
//    switch option {
//    case "-t":
//        benchmark = try TimeBenchmark()
//    case "-m":
//        CompareAlgorithmsCoverage().run()
//        exit(0)
//    case "-g1":
//        let benchmark = GraphVisualization()
//        benchmark.algorithms = [GreCon(), GreConD()]
//        benchmark.run()
//        exit(0)
//    case "-g2":
//        let benchmark = GraphVisualization()
//        benchmark.algorithms = [GreCon2(), GreConD()]
//        benchmark.run()
//        exit(0)
//    case "-p":
//        benchmark = try PartialFactorization()
//    case "-pg":
//        let benchmark = PartialGraphVisualization()
//        benchmark.run()
//        exit(0)
//    default:
//        print("Unknown option \(option)")
//        exit(1)
//    }
//
//    benchmark.run()
//} catch {
//    print(error.localizedDescription)
//    exit(1)
//}

import FcaKit
import Foundation

#if DEBUG
    FileManager.default.changeCurrentDirectoryPath("/Users/romanvyjidacek/Library/Mobile Documents/com~apple~CloudDocs/UPOL/phd/research/grecon2_experiments/")
#endif

do {
    try computeAndStoreFactorisation()
    //try timeBenchmark()
    //try compareGreConAndGreConDCoverage()
} catch {
    fatalError(error.localizedDescription)
}
