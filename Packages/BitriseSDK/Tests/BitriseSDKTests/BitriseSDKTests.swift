import XCTest
@testable import BitriseSDK

final class BitriseSDKTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BitriseSDK().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
