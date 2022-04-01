import XCTest

import fetch_node_detailsTests

var tests = [XCTestCaseEntry]()
tests += fetch_node_detailsTests.allTests()
tests +=fetch_node_detailsTestsAsync.allTests()
XCTMain(tests)
