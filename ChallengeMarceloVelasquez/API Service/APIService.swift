//
//  APIService.swift
//  ChallengeMarceloVelasquez
//
//  Created by Marcelo Stefano Velasquez Herrera on 3/09/21.
//

import Foundation

class APIService :  NSObject {
    
    private let urlBooks = URL(string: "https://raw.githubusercontent.com/ejgteja/files/main/books.json")!
    private let urlBooksBestSellers = URL(string: "https://raw.githubusercontent.com/ejgteja/files/main/best_sellers.json")!
    
    func getBooks(completion : @escaping (BooksModel) -> ()){
        
        URLSession.shared.dataTask(with: urlBooks) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let bookData = try! jsonDecoder.decode(BooksModel.self, from: data)
            
                    completion(bookData)
            }
            
        }.resume()
    }
    
    func getBooksBestSellers(completion : @escaping (BooksBestSellersModel) -> ()){
        
        URLSession.shared.dataTask(with: urlBooksBestSellers) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let bookBestSellersData = try! jsonDecoder.decode(BooksBestSellersModel.self, from: data)
            
                    completion(bookBestSellersData)
            }
            
        }.resume()
    }
    
}
