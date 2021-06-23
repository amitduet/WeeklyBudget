//
//  ViewController.swift
//  WeeklyBudget
//
//  Created by Amit Chowdhury on 5/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalBudgetTextField:UITextField!
    @IBOutlet weak var weeklyRemaingLabel:UILabel!
    @IBOutlet weak var dailyRemaingLabel:UILabel!
    @IBOutlet weak var spendAmountTextField:UITextField!
    
    var budget:Budget!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: UITextFieldDelegate

extension ViewController:UITextFieldDelegate{
    
    fileprivate func updateLabel() {
        weeklyRemaingLabel.text = budget.weeklyRemaining.moneyString
        dailyRemaingLabel.text = budget.dailyRemaining.moneyString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let total = Decimal(string: textField.text!) else {
            return true
        }
        
        if (textField == totalBudgetTextField){
            budget = Budget(total: total)
        }else if (textField == spendAmountTextField){
            budget.addTransaction(amount: total, timestamp: Date())
        }        
        updateLabel()
        return true
    }
}
