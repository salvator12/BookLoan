## Book Loan
***
### Overview
This project is an app to show information about people who loan books.
***
### How To Run
1. **Installation**:
   - Clone the repository:
     ```https://github.com/salvator12/BookLoan.git```
   - Navigate into project directory:
     ```cd project-directory```
     
2. **Open the Project in Xcode**
   - Double-click on the BookLoanApp.xcodeproj file to open the project in Xcode.

4. **Build and Run**
   - Select your target device or simulator and press the Run button (or Cmd+R) in Xcode.
***

### Features
Feature 1: Fetching loan books from API.<br />
Feature 2: Display a list of detailed information about loan books.
***

### Additional Features
Feature 1: Sorting a list of loan books data based on loan amount, term, or purpose.<br />
Feature 2: Searching for specific loan books based on borrower name.
***

### Approach
- Utilizes Swift's '**API Request**' library to fetch data from the API endpoint.
- Parse JSON response and extract relevant data.
***

### Decisions
- Choice of Framework: Using SwiftUI framework to create this app because it is easier to read and write the code and also supports Live Preview.
- Choice of Design Pattern: Using MVVM because the SwiftUI concept was suitable with MVVM where this UI framework supports data binding and observes mechanisms ensuring UI Update automatically.
***

### Code Structures
- '**Applications/**': Directory containing a file of app entry point.
- **Applications/BookLoanAppApp.swift**: The entry point of the Book Loan application.
- '**Features/**': Directory containing files of app features.
- '**Features/Loan/Model/BookLoanData.swift**': Defines the data structures of loan books in the application.
- '**Features/Loan/View/BookLoanView.swift**': The main view of the application displays the list of loan books.
- '**Features/Loan/View/BookLoanDetailView.swift**': The child view of BookLoanView to displays the detail information of chosen loan book.
- '**Features/Loan/View/Modifiers/BookLoanCard.swift**': A view component to displays information about borrower name, loan of amount, interest rate, term, purpose, and risk rating.
- '**Features/Loan/ViewModel/BookLoanViewModel.swift**': A view-model contains store variables, business logic and presentation logic to be processed so that it can be displayed to the BookLoanView and BookLoanDetailView.
- '**Services/**': Directory containing files of code to connect the app with third party another stuff with internet.
- '**Services/BookLoanAPIManager.swift**': A file to fetching data of loan books from API.
- '**Utilities/**': Directory containing helpful functions that can use throughout the app.
- '**Utilities/Entities/SortTag.swift**': file containing an enum structures to indicating current type of sort that user chose.


