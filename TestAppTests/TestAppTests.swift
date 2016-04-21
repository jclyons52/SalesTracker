//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Administrator on 18/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import XCTest
@testable import TestApp

class TestAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let sale = Sale(purchaseCost: 11.0, saleCost: 22.0, productCare: true )
        
        XCTAssert(sale.purchaseCost == 11)
        XCTAssert(sale.saleCost == 22)
        XCTAssert(sale.productCare)
    }
    
    func testProfitComputedProperty() {
        let sale = Sale(purchaseCost: 11, saleCost: 25 ,productCare: true)
        
        XCTAssert(sale.profit == 14)
    }
    
}
