//
//  MeasuringInTestsUITests.swift
//  MeasuringInTestsUITests
//
//  Created by Toomas Vahter on 14.12.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import XCTest

final class MeasuringInTestsUITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func testCalculateWithClockMetric() {
        let app = XCUIApplication()
        app.launch()
        measure(metrics: [XCTClockMetric()]) {
            app.buttons["Process"].tap()
        }
    }
    
    func testCalculateWithMemoryMetric() {
        let app = XCUIApplication()
        app.launch()
        measure(metrics: [XCTMemoryMetric(application: app)]) {
            app.buttons["Process"].tap()
        }
    }
    
    func testCalculateWithCPUMetric() {
        let app = XCUIApplication()
        app.launch()
        measure(metrics: [XCTCPUMetric(application: app)]) {
            app.buttons["Process"].tap()
        }
    }
    
    func testCalculateWithStorageMetric() {
        let app = XCUIApplication()
        app.launch()
        measure(metrics: [XCTStorageMetric(application: app)]) {
            app.buttons["Process"].tap()
        }
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
