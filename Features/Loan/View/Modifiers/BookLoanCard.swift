//
//  BookLoanCard.swift
//  BookLoan
//
//  Created by Yehezkiel Salvator Christanto on 02/07/24.
//

import SwiftUI

struct BookLoanCard: View {
    var loanData: BookLoanData?
    var body: some View {
        VStack(alignment: .leading) {
            Text(loanData?.borrower.name ?? "Unknown")
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                Text("Loan Amount:")
                Text(String(loanData?.amount ?? 0))
                    .fontWeight(.bold)
            }
            HStack {
                Text("Interest Rate")
                Text(String(loanData?.interestRate ?? 0.0))
                    .fontWeight(.bold)
            }
            HStack {
                Text("Term (in months):")
                Text(String(loanData?.term ?? 0))
                    .fontWeight(.bold)
            }
            HStack {
                Text("Purpose:")
                Text(loanData?.purpose ?? "-")
                    .fontWeight(.bold)
            }
            HStack {
                Text("Risk Rating:")
                Text(loanData?.riskRating ?? "-")
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    BookLoanCard()
}
