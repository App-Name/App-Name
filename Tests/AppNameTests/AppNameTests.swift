// This is free software: you can redistribute and/or modify it
// under the terms of the GNU General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

import XCTest
import OSLog
import Foundation
@testable import AppName

let logger: Logger = Logger(subsystem: "AppName", category: "Tests")

@available(macOS 13, *)
final class AppNameTests: XCTestCase {

    func testAppName() throws {
        logger.log("running testAppName")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("AppName", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
