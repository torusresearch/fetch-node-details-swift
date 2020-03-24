import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(fetch_node_detailsTests.allTests),
        testCase(fetch_node_detailsTestsAsync.allTests)
    ]
}
#endif
