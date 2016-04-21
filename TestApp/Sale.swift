//
//  Sale.swift
//  TestApp
//
//  Created by Administrator on 21/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation

class Sale: NSObject, NSCoding {
    
    let purchaseCost: Double
    let saleCost: Double
    let productCare: Bool
    let date: NSDate
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("sales")
    
    // MARK: Types
    
    struct PropertyKey {
        static let purchaseCostKey = "purchaseCost"
        static let saleCostKey = "saleCost"
        static let productCareKey = "productCare"
    }
    
    init?(purchaseCost: Double, saleCost: Double, productCare: Bool) {
        self.purchaseCost = purchaseCost
        self.saleCost = saleCost
        self.productCare = productCare
        self.date = NSDate()
        
        super.init()
    }
    
    var profit: Double {
        get {
            return saleCost - purchaseCost
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeDouble(purchaseCost, forKey: PropertyKey.purchaseCostKey)
        aCoder.encodeDouble(saleCost, forKey: String(PropertyKey.saleCostKey))
        aCoder.encodeBool(productCare, forKey: String(PropertyKey.productCareKey))
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let purchaseCost = aDecoder.decodeDoubleForKey(PropertyKey.purchaseCostKey)
        let saleCost = aDecoder.decodeDoubleForKey(PropertyKey.saleCostKey)
        let productCare = aDecoder.decodeBoolForKey(PropertyKey.productCareKey)
        
        // Must call designated initializer.
        self.init(purchaseCost: purchaseCost, saleCost: saleCost, productCare: productCare)
    }
    
    
}