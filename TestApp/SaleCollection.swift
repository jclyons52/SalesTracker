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
    
    var productCareRatio: Double {
        get {
            let productCare = self.sales.map({ return $0.productCare })
            let withProductCare = productCare.filter({ $0 }).count
            
            return Double(withProductCare) / Double(productCare.count)
        }
    }
    
    func addSale(sale: Sale) {
        return self.sales.append(sale)
    }
    
    func commission(percentage: Int) -> Double {
        let x = self.totalProfit * Double(percentage) / 100
        
        return Double(round(10*x)/10)
    }
    
    func saveSales() -> Bool {
        return NSKeyedArchiver.archiveRootObject(self.sales, toFile: Sale.ArchiveURL.path!)
    }
    
    func loadSales() -> Bool {
        let sales = NSKeyedUnarchiver.unarchiveObjectWithFile(Sale.ArchiveURL.path!) as? [Sale]
        if ((sales) != nil) {
            self.sales = sales!
            return true
        }
        self.sales = []
        return false
    }
    // date selection
    func fromYesterday() -> [Sale] {
        let secondsPerDay: NSTimeInterval = 24 * 60 * 60
        let yesterday: NSDate? = NSDate(timeIntervalSinceNow: -secondsPerDay)
        return self.forDay(yesterday!)
    }
    
    func forDay(date: NSDate) -> [Sale] {
        let calendar = NSCalendar.currentCalendar()
        return self.sales.filter({
            let result = calendar.compareDate($0.date, toDate: date, toUnitGranularity: NSCalendarUnit.Day)
            return (result == NSComparisonResult.OrderedSame)
        })

    }
}