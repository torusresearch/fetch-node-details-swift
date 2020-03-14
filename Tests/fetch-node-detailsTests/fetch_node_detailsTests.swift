import XCTest
@testable import fetch_node_details

final class fetch_node_detailsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var fnd = FetchNodeDetails()
        let res = fnd.getCurrentEpoch()
        print(res)
        //        XCTAssertEqual(fetch_node_details().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
