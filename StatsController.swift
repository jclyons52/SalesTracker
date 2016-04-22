//
//  StatsController.swift
//  TestApp
//
//  Created by Administrator on 21/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class StatsController: UIViewController {
    
    @IBOutlet weak var totalSales: UILabel!
    
    @IBOutlet weak var profit: UILabel!
    
    @IBOutlet weak var commission: UILabel!
    
    @IBOutlet weak var productCareRatio: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let saleCollection = SaleCollection()

    @IBAction func filterByDate(sender: AnyObject) {
        let date = datePicker.date
        
        let sales = saleCollection.forDay(date)
        
        let filteredSaleCollection = SaleCollection()
        
        filteredSaleCollection.sales = sales
        
        renderStats(filteredSaleCollection)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        saleCollection.loadSales()
        
        renderStats(saleCollection)
    }
    
    override func viewDidAppear(animated: Bool) {
        saleCollection.loadSales()
        
        profit.text = String(saleCollection.totalProfit)
        
        totalSales.text = String(saleCollection.totalSales)
        
        productCareRatio.text = String(saleCollection.productCareRatio)
        
        commission.text =  String(saleCollection.commission(5))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func renderStats(saleCollection: SaleCollection) {
        profit.text = String(saleCollection.totalProfit)
        
        totalSales.text = String(saleCollection.totalSales)
        
        productCareRatio.text = String(saleCollection.productCareRatio)
        
        commission.text =  String(saleCollection.commission(5))
    }

}
