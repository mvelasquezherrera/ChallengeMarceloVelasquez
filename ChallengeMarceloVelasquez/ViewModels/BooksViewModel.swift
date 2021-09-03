//
//  BooksViewModel.swift
//  ChallengeMarceloVelasquez
//
//  Created by Marcelo Stefano Velasquez Herrera on 3/09/21.
//

import Foundation

class BooksViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var booksData : BooksModel! {
        didSet {
            self.bindBooksViewModelToController()
        }
    }
    
    private(set) var booksBestSellersData : BooksBestSellersModel! {
        didSet {
            self.bindBooksViewModelToController()
        }
    }
    
    var bindBooksViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callGetBooks()
        callGetBooksBestSellers()
    }
    
    func callGetBooks() {
        self.apiService.getBooks { (booksData) in
            self.booksData = booksData
        }
    }
    
    func callGetBooksBestSellers() {
        self.apiService.getBooksBestSellers { (booksBestSellersData) in
            self.booksBestSellersData = booksBestSellersData
        }
    }
    
}
