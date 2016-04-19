//
//  ViewController.swift
//  TestApp
//
//  Created by Administrator on 18/04/2016.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var salesTally: [Double] = []
    var storeCostTally: [Double] = []
    var productCareTally: [Bool] = []
    @IBOutlet weak var storeCost: UITextField!
    @IBOutlet weak var saleCost: UITextField!
    @IBOutlet weak var commissionRate: UITextField!
    @IBOutlet weak var productCare: UISwitch!
    @IBOutlet weak var totalSales: UILabel!
    @IBOutlet weak var profit: UILabel!
    @IBOutlet weak var productCareRatio: UILabel!
    @IBOutlet weak var totalCommission: UILabel!
    @IBAction func save(sender: AnyObject) {
        salesTally += saleCost.text!.isEmpty ? [0.0] : [Double(saleCost.text!)!]
        storeCostTally += storeCost.text!.isEmpty ? [0.0] : [Double(storeCost.text!)!]
        productCareTally += [productCare.on]
        let totalProfit = salesTally.reduce(0, combine: +) - storeCostTally.reduce(0, combine: +)
        profit.text = String(totalProfit)
        totalSales.text = String(storeCostTally.reduce(0, combine: +))
        print(productCareTally.filter({ $0 }).count, productCareTally.count, productCareTally)
        productCareRatio.text = String(Double(productCareTally.filter({ $0 }).count) / Double(productCareTally.count))
        let commission = commissionRate.text!.isEmpty ? 0.0 : Double(commissionRate.text!)!
        totalCommission.text =  String(totalProfit * (commission / 100))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

