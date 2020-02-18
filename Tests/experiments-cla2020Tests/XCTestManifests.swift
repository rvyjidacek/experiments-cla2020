import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(experiments_cla2020Tests.allTests),
    ]
}
#endif
