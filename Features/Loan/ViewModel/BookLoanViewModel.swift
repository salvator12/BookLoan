//
//  BookLoanViewModel.swift
//  BookLoan
//
//  Created by Yehezkiel Salvator Christanto on 01/07/24.
//

import Foundation

class BookLoanViewModel: ObservableObject {
    @Published var borrowerSearchFiled: String = ""
    @Published var sortToggled = false
    @Published var sortTag: SortTag = .none
    
    @Published private var bookLoanObject: [BookLoanData] = []
    @Published private var bookLoanSort: [BookLoanData] = []
    
    private var bookLoanAPIManager = BookLoanAPIManager()
    
    
    var filteredBookLoan: [BookLoanData] {
        guard borrowerSearchFiled != "" else {
            if sortTag == .none {
                return bookLoanObject
            } else {
                return bookLoanSort
            }
            
        }
        if sortTag == .none {
            return bookLoanObject.filter { $0.borrower.name.lowercased().contains(borrowerSearchFiled.lowercased())}
        } else {
            return bookLoanSort.filter { $0.borrower.name.lowercased().contains(borrowerSearchFiled.lowercased())}
        }
        
    }
    
    func callingAPI() {
        bookLoanAPIManager.fetchData { [weak self] bookLoanData in
            DispatchQueue.main.async {
                self?.bookLoanObject = bookLoanData ?? []
                self?.bookLoanSort = bookLoanData ?? []
            }
        }
    }
    
    func filterSort() {
        bookLoanSort = bookLoanObject
        if sortTag == .amount {
            bookLoanSort.sort(by: {$0.amount < $1.amount})
        } else if sortTag == .term {
            bookLoanSort.sort(by: {$0.term < $1.term })
        } else if sortTag == .purpose {
            bookLoanSort.sort(by: {$0.purpose < $1.purpose})
        }
    }
}
