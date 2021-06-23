//
//  MoneyFormatterTests.swift
//  WeeklyBudgetTests
//
//  Created by Amit Chowdhury on 5/5/20.
//

import XCTest
@testable import WeeklyBudget


class MoneyFormatterTests: XCTestCase {

    func testMoneyFormaterWholeNumber(){
        XCTAssertEqual(Decimal(string: "0")?.moneyString, "0.00")
        XCTAssertEqual( Decimal(string: "1")?.moneyString, "1.00")
        XCTAssertEqual(Decimal(string: "123")?.moneyString, "123.00")
        XCTAssertEqual(Decimal(string: "-2")?.moneyString, "-2.00")
    }

    func testMoneyFormaterWholeNumberWithOneDecimalPlace(){
        XCTAssertEqual(Decimal(string: "1.1")?.moneyString, "1.10")
        XCTAssertEqual(Decimal(string: "1.2")?.moneyString, "1.20")
        XCTAssertEqual(Decimal(string: "1.3")?.moneyString, "1.30")
        XCTAssertEqual(Decimal(string: "-1.3")?.moneyString, "-1.30")
    }
    
    func testMoneyFormaterWholeNumberWithTwoDecimalPlace(){
        XCTAssertEqual(Decimal(string: "1.1")?.moneyString, "1.10")
        XCTAssertEqual(Decimal(string: "1.22")?.moneyString, "1.22")
        XCTAssertEqual(Decimal(string: "-1.12")?.moneyString, "-1.12")

    }
    
    func testMoneyFormaterWholeNumberWithAnyDecimalPlace(){
        XCTAssertEqual(Decimal(string: "1.111")?.moneyString, "1.11")
        XCTAssertEqual(Decimal(string: "1.2")?.moneyString, "1.20")
        XCTAssertEqual(Decimal(string: "1.119")?.moneyString, "1.11")
        
        XCTAssertEqual(Decimal(string: "1.1395656")?.moneyString, "1.13")
        
        XCTAssertEqual(Decimal(string: "-1.23456789")?.moneyString, "-1.24")



    }

}
