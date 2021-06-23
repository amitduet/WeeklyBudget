//
//  Budget.swift
//  WeeklyBudget
//
//  Created by Amit Chowdhury on 5/5/20.
//

import Foundation

class Budget {
    
    var weeklyRemaining:Decimal {
        return _weeklyRemaining
    }
    
    var dailyRemaining:Decimal{
        return _dailyRemaining
    }
    
    private var _weeklyRemaining:Decimal
    private var _dailyRemaining:Decimal
    
    init(total:Decimal) {
        _weeklyRemaining = total
        _dailyRemaining = total/7
    }
    
    func addTransaction(amount:Decimal, timestamp:Date){
        _dailyRemaining -= amount
        _weeklyRemaining -= amount
    }
}
