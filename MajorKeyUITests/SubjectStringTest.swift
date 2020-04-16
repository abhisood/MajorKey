import XCTest
@testable import Major_Key

class SubjectStringTest: XCTestCase {
    func testSubjectString() {
        var text = "Hi how are you? I am good."
        XCTAssertEqual(text, "\(text.subjectText)")
    }
}
