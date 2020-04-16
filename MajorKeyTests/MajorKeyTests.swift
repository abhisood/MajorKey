import XCTest
@testable import Major_Key

class MajorKeyTests: XCTestCase {
    func testSubjectString() {
        var text = "Hi how are you? I am good."
        XCTAssertEqual(text, "\(text.subjectText)")

        text = "Hi how are you? \nI am good."
        XCTAssertEqual("\(text.subjectText)", "Hi how are you? ")

        text = """
Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good. Hi how are you? I am good.
Hi how are you? I am good.
"""
        XCTAssertEqual(text.subjectText.count, 200)
    }
}
