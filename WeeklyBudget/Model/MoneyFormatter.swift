//
//  MoneyFormatter.swift
//  WeeklyBudget
//
//  Created by Amit Chowdhury on 5/5/20.
//

import Foundation

extension Decimal {
    var moneyString:String{
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.roundingMode = .floor
        return numberFormatter.string(from: self as NSDecimalNumber) ?? ""
    }
}
