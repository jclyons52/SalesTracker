//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Administrator on 18/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import XCTest
@testable import TestApp

class TestSaleCollection: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // SaleCollection tests
    
    func testAddSales() {
        let saleCollection = getSaleCollection()
        
        XCTAssert(saleCollection.sales.count > 0)
    }
    
    func testGetsTotalSales() {
        let saleCollection = getSaleCollection()
        
        XCTAssert(saleCollection.totalSales == 50)
    }
    func testGetTotalCost() {
        let saleCollection = getSaleCollection()
        
        XCTAssert(saleCollection.totalCost == 22)
    }
    
    func testGetTotalProfit() {
        let saleCollection = getSaleCollection()
        
        XCTAssert(saleCollection.totalProfit == 28)
    }
    
    func testGetCommission()
    {
        let saleCollection = getSaleCollection()
        
        XCTAssert(saleCollection.commission(5) == 1.4)
        
    }
    
    func testGetProductCareRatio()
    {
        let saleCollection = getSaleCollection()
        XCTAssert(saleCollection.productCareRatio == 0.5)
    }
    
    func testSaveAndLoad() {
        let saleCollection = getSaleCollection()
        saleCollection.saveSales();
        
        let newCollection = SaleCollection()
        newCollection.loadSales()
        XCTAssert(newCollection.sales.count == 2)
    }
    
    func getSaleCollection() -> SaleCollection {
        let sale1 = Sale(purchaseCost: 11, saleCost: 25 ,productCare: true)!
        let sale2 = Sale(purchaseCost: 11, saleCost: 25 ,productCare: false)!
        let saleCollection = SaleCollection()
        saleCollection.addSale(sale1)
        saleCollection.addSale(sale2)
        
        return saleCollection

    }
}
