//
//  BudgetTests.swift
//  WeeklyBudgetTests
//
//  Created by Amit Chowdhury on 5/5/20.
//

import XCTest
@testable import WeeklyBudget

class BudgetTests: XCTestCase {

    func testBudgetWeeklyRemaining(){
        let amounts:[Decimal] = [0, 1, 2, 124, 44]
        amounts.forEach{ amount in
            let budget = Budget(total: amount)
            XCTAssertEqual(budget.weeklyRemaining, amount)
        }
    }

    func testBudgetDailyRemaining(){
        
        let amounts:[Decimal] = [0, 1, 2, 124, 44, 7, 14, 20]
        amounts.forEach{ amount in
            let budget = Budget(total: amount)
            XCTAssertEqual(budget.dailyRemaining, amount/7, "Daily Remaining is not equal \(amount/7)")
        }
    }

    func testTransactiontDeductWeeklyRemaining(){
        let budget = Budget(total: 10)
        budget.addTransaction(amount:0, timestamp:Date())
        XCTAssertEqual(budget.weeklyRemaining, 10)

        budget.addTransaction(amount:1, timestamp:Date())
        XCTAssertEqual(budget.weeklyRemaining, 9)
        
        budget.addTransaction(amount:2, timestamp:Date())
        XCTAssertEqual(budget.weeklyRemaining, 7)


    }

    func testTransactionDeductDailyRemaining(){
        
        let budget = Budget(total: 70)
        budget.addTransaction(amount:0, timestamp:Date())
        XCTAssertEqual(budget.dailyRemaining, 10)

        budget.addTransaction(amount:1, timestamp:Date())
        XCTAssertEqual(budget.dailyRemaining, 9)

    }
}
