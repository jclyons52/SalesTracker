//
//  SaleCollection.swift
//  TestApp
//
//  Created by Administrator on 21/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import Foundation

class SaleCollection {
    
    var sales: [Sale] = []
    
    var totalSales: Double {
        get {
            return self.sales
                .map({ return $0.saleCost })
                .reduce(0, combine: +)
        }
    }
    
    var totalCost: Double {
        get {
            return self.sales
                .map({ return $0.purchaseCost })
                .reduce(0, combine: +)
        }
    }
    
    var totalProfit: Double {
        get {
            return self.totalSales - self.totalCost
        }
    }
    
    func addSale(sale: Sale) {
        return self.sales.append(sale)
    }
    
    func commission(percentage: Int) -> Double {
        let x = self.totalProfit * Double(percentage) / 100
        
        return Double(round(10*x)/10)
    }
}