import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(bmf_experimentsTests.allTests),
    ]
}
#endif
