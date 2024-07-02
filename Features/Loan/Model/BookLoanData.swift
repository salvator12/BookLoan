//
//  BookLoanData.swift
//  BookLoan
//
//  Created by Yehezkiel Salvator Christanto on 01/07/24.
//

import Foundation

struct BookLoanData: Decodable {
    let id: String
    let amount: Int
    let interestRate: Double
    let term: Int
    let purpose: String
    let riskRating: String
    let borrower: Borrower
    let collateral: Collateral
    let documents: [Documents]?
    let repaymentSchedule: RepaymentSchedule
}

struct Borrower: Decodable {
    let id: String
    let name: String
    let email: String
    let creditScore: Int
}

struct Collateral: Decodable {
    let type: String
    let value: Int
    
}

struct Documents: Decodable, Hashable {
    let type: String?
    let url: String?
}

struct RepaymentSchedule: Decodable {
    let installments: [Installments]
}

struct Installments: Decodable, Hashable {
    let dueDate: String
    let amountDue: Int
}
