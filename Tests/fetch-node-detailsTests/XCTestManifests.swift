import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(fetch_node_detailsTests.allTests),
    ]
}
#endif
