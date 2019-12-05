//
//  PeopleAndAppleStockPricesUITests.swift
//  PeopleAndAppleStockPricesUITests
//
//  Created by Tsering Lama on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices

class PeopleAndAppleStockPricesUITests: XCTestCase {

    func testPeopleData() {
        let fileName = "userinfo"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: fileName, ext: ext)
        
        XCTAssertNotNil(data)
    }
}
