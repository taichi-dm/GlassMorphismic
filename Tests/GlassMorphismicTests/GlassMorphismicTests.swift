import XCTest
@testable import GlassMorphismic

final class GlassMorphismicTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        if #available(iOS 13.0, *) {
            XCTAssertEqual(GlassMorphismic(blurIntensity: 10, cornerRadius: 0, shadowRadius: 0).blurIntensity, 10)
            XCTAssertEqual(GlassMorphismic(blurIntensity: 10, cornerRadius: 0, shadowRadius: 0).cornerRadius, 10)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
