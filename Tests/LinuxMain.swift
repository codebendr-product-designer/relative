import XCTest

import relativeTests

var tests = [XCTestCaseEntry]()
tests += relativeTests.allTests()
XCTMain(tests)
