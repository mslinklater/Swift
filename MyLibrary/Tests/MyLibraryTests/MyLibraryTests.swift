import XCTest
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {
    func testEmail() throws {
        let email = try Email("john.appleseed@apple.com")
        XCTAssertEqual(email.description, "john.appleseed@apple.com")
        XCTAssertThrowsError(try Email("invalid"))
    }
}
