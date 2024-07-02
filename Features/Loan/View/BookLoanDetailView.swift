//
//  BookLoanDetailView.swift
//  BookLoan
//
//  Created by Yehezkiel Salvator Christanto on 01/07/24.
//

import SwiftUI

struct BookLoanDetailView: View {
    var bookLoanDetailData: BookLoanData?
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .center) {
                    Text(bookLoanDetailData?.borrower.name ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(bookLoanDetailData?.borrower.email ?? "sdfsdfsdfsdfsdfsdfsdfdsf")
                        .font(.title3)
                        .foregroundStyle(.black)
                }
                .frame(maxWidth: .infinity)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Credit Score")
                                .font(.callout)
                            Text(String(bookLoanDetailData?.borrower.creditScore ?? 0))
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Collateral Type")
                                .font(.callout)
                            Text(bookLoanDetailData?.collateral.type ?? "-")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Collateral Value")
                                .font(.callout)
                            Text(String(bookLoanDetailData?.collateral.value ?? 0))
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Repayment Schedule")
                                .font(.callout)
                            ForEach(bookLoanDetailData?.repaymentSchedule.installments ?? [], id: \.self) { data in
                                HStack(spacing: 50) {
                                    Text(data.dueDate)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text(String(data.amountDue))
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Documents")
                            if bookLoanDetailData?.documents != nil {
                                if ((bookLoanDetailData!.documents!.isEmpty)) {
                                    Text("No Documents are available")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .italic()
                                } else {
                                    ForEach(bookLoanDetailData?.documents ?? [], id: \.self) { data in
                                        Text(data.type ?? "")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        AsyncImage(url: URL(string: data.url ?? ""))
                                            .frame(width: 200, height: 200)
                                    }
                                }
                            }
                            
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.7)
            }
            
        }
        
    }
}

#Preview {
    BookLoanDetailView()
}
