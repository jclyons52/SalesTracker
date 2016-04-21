//
//  ViewController.swift
//  TestApp
//
//  Created by Administrator on 18/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let saleCollection = SaleCollection()
    @IBOutlet weak var storeCost: UITextField!
    @IBOutlet weak var saleCost: UITextField!
    @IBOutlet weak var commissionRate: UITextField!
    @IBOutlet weak var productCare: UISwitch!
    @IBOutlet weak var totalSales: UILabel!
    @IBOutlet weak var profit: UILabel!
    @IBOutlet weak var productCareRatio: UILabel!
    @IBOutlet weak var totalCommission: UILabel!
    @IBAction func save(sender: AnyObject) {
        addSale()
        
        profit.text = String(saleCollection.totalProfit)
        totalSales.text = String(saleCollection.totalSales)

        productCareRatio.text = String(saleCollection.productCareRatio)
        let commission = commissionRate.text!.isEmpty ? 0 : Int(commissionRate.text!)!
        totalCommission.text =  String(saleCollection.commission(commission))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addSale() {
        let salesTally = Double(saleCost.text!)
        let storeCostTally = Double(storeCost.text!)
        let productCareTally = productCare.on
        let sale = Sale(purchaseCost: storeCostTally!, saleCost: salesTally!, productCare: productCareTally)!
        self.saleCollection.addSale(sale)
        
        saleCost.text = nil
        storeCost.text = nil
    }


}

