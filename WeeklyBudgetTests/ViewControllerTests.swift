//
//  ViewControllerTests.swift
//  WeeklyBudgetTests
//
//  Created by Amit Chowdhury on 5/6/20.
//

import XCTest
@testable import WeeklyBudget

class ViewControllerTests: XCTestCase {

    var viewController:ViewController!
    
    override func setUp() {
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController
        _ = viewController.view
    }
    
    func testCreateingNewBudgetUpdateRemainingLabels(){
        
        let totalBudgetTextField = viewController.totalBudgetTextField!
        totalBudgetTextField.text = "100"
        _ = totalBudgetTextField.delegate?.textFieldShouldReturn?(totalBudgetTextField)
        
        let budget = viewController.budget
        XCTAssertEqual(viewController.weeklyRemaingLabel.text,budget?.weeklyRemaining.moneyString )
        
        XCTAssertEqual(viewController.dailyRemaingLabel.text,budget?.dailyRemaining.moneyString )
    }

    func testTransactionUpdateRemaingLabel(){
        
        let totalBudgetTextField = viewController.totalBudgetTextField!
        totalBudgetTextField.text = "70"
        _ = totalBudgetTextField.delegate?.textFieldShouldReturn?(totalBudgetTextField)

        let budget = viewController.budget 

        let spendTextField = viewController.spendAmountTextField!
        spendTextField.text = "2"
        
        XCTAssertEqual(viewController.weeklyRemaingLabel.text,budget?.weeklyRemaining.moneyString )
        XCTAssertEqual(viewController.dailyRemaingLabel.text,budget?.dailyRemaining.moneyString )
    }
}
