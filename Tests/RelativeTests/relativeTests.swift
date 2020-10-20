import XCTest
@testable import Relative

final class relativeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(relative().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
