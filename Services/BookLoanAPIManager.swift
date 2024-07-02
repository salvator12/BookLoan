//
//  BookLoanManage.swift
//  BookLoan
//
//  Created by Yehezkiel Salvator Christanto on 01/07/24.
//

import Foundation

struct BookLoanAPIManager {
    func fetchData(completion: @escaping ([BookLoanData]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/andreascandle/p2p_json_test/main/api/json/loans.json"
        performRequest(urlString, completion: completion)
        
    }
    
    func performRequest(_ urlString: String, completion: @escaping ([BookLoanData]?) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                guard error == nil else {
//                    print(error)
                    return
                }
                
                if let safeData = data {
                    let bookLoanData = parseJSON(safeData)
                    completion(bookLoanData)
                }
            }
            task.resume()
            
        }
        completion(nil)
    }
    
    func parseJSON(_ bookLoanData: Data) -> [BookLoanData]? {
        do {
            let decodedData = try JSONDecoder().decode([BookLoanData].self, from: bookLoanData)
            return decodedData
        } catch {
            print(error)
        }
        return nil
    }
}
