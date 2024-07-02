//
//  BookLoanView.swift
//  BookLoan
//
//  Created by Yehezkiel Salvator Christanto on 01/07/24.
//

import SwiftUI

struct BookLoanView: View {
    @StateObject var bookLoanViewModel = BookLoanViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    List {
                        ForEach(bookLoanViewModel.filteredBookLoan.indices, id: \.self) { idx in
                            NavigationLink {
                                BookLoanDetailView(bookLoanDetailData: bookLoanViewModel.filteredBookLoan[idx])
                            } label: {
                                BookLoanCard(loanData: bookLoanViewModel.filteredBookLoan[idx])
                            }

                        }
                        
                    }
                }
                .searchable(
                    text: $bookLoanViewModel.borrowerSearchFiled,
                    placement: .navigationBarDrawer(
                        displayMode: .always
                    ), prompt: Text("borrower name")
                )
                .navigationTitle("Book Loan")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            bookLoanViewModel.sortToggled.toggle()
                        }, label: {
                           Image(systemName: "line.3.horizontal.decrease.circle")
                        })
                        .popover(isPresented: $bookLoanViewModel.sortToggled, content: {
                            VStack(alignment: .leading) {
                                Button(action: {
                                    bookLoanViewModel.sortTag = .none
                                    bookLoanViewModel.filterSort()
                                }, label: {
                                    HStack {
                                        Text("None")
                                        Spacer()
                                        if bookLoanViewModel.sortTag == .none {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.blue)
                                        }
                                        
                                    }
                                })
                                .buttonStyle(.plain)
                                .padding()
                                Divider()
                                Button(action: {
                                    bookLoanViewModel.sortTag = .amount
                                    bookLoanViewModel.filterSort()
                                }, label: {
                                    HStack {
                                        Text("Sort by Amount")
                                        Spacer()
                                        if bookLoanViewModel.sortTag == .amount {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                })
                                .buttonStyle(.plain)
                                .padding()
                                Divider()
                                Button(action: {
                                    bookLoanViewModel.sortTag = .term
                                    bookLoanViewModel.filterSort()
                                }, label: {
                                    HStack {
                                        Text("Sort by Term")
                                        Spacer()
                                        if bookLoanViewModel.sortTag == .term {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                })
                                .buttonStyle(.plain)
                                .padding()
                                Divider()
                                Button(action: {
                                    bookLoanViewModel.sortTag = .purpose
                                    bookLoanViewModel.filterSort()
                                }, label: {
                                    HStack {
                                        Text("Sort by Purpose")
                                        Spacer()
                                        if bookLoanViewModel.sortTag == .purpose {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                })
                                .buttonStyle(.plain)
                                .padding()
                                Divider()
                            }
                            .presentationCompactAdaptation(.popover)
                            .frame(width: 200)
                        })
                        
                    }
                    
            }
            }
        }
        .onAppear {
            bookLoanViewModel.callingAPI()
        }
    }
}

#Preview {
    BookLoanView()
}
