//
//  Sale.swift
//  TestApp
//
//  Created by Administrator on 21/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation

class Sale {
    
    let purchaseCost: Double
    let saleCost: Double
    let productCare: Bool
    let date: NSDate
    
    init(purchaseCost: Double, saleCost: Double, productCare: Bool) {
        self.purchaseCost = purchaseCost
        self.saleCost = saleCost
        self.productCare = productCare
        self.date = NSDate()
    }
    
    var profit: Double {
        get {
            return saleCost - purchaseCost
        }
    }
    
    
}