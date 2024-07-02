## Book Loan

### Overview
This project is an app to show information about people who loan books.

### How To Run
1. Installation:
   - Clone the repository:
     ```https://github.com/salvator12/BookLoan.git```
   - Navigate into project directory:
     ```cd project-directory```

### Features
Feature 1: Fetching loan books from API.
Feature 1: Display a list of detailed information about loan books.

### Additional Features
Feature 1: Sorting a list of loan books data based on loan amount, term, or purpose.
Feature 2: Searching for specific loan books based on borrower name.

### Approach
- Utilizes Swift's '**API Request**' library to fetch data from the API endpoint.
- Parse JSON response and extract relevant data.

### Decisions
- Choice of Framework: Using SwiftUI framework to create this app because it is easier to read and write the code and also supports Live Preview.
- Choice of Design Pattern: Using MVVM because the SwiftUI concept was suitable with MVVM where this UI framework supports data binding and observes mechanisms ensuring UI Update automatically.

### Code Structures
- '**Applications/**': Directory containing a file of app entry point.
- '**Features/**': Directory containing files of app features.
- '**Services/**': Directory containing files of code to connect the app with third party another stuff with internet.
- '**Utilities/**': Directory containing helpful functions that can use throughout the app.


