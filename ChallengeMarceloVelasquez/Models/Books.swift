//
//  Books.swift
//  ChallengeMarceloVelasquez
//
//  Created by Marcelo Stefano Velasquez Herrera on 3/09/21.
//

import Foundation

struct BooksModel: Decodable {
    let results: BooksResultModel
}

struct BooksResultModel: Decodable {
    let books: [BookModel]
}

struct BookModel: Decodable {
    let isbn: String
    let title: String
    let author: String
    let description: String
    let genre: String
    let img: String
    let imported: Bool
}

struct BooksBestSellersModel: Decodable {
    let results: BooksBestSellersResultModel
}

struct BooksBestSellersResultModel: Decodable {
    let best_sellers: [String]
}

struct ListBookSectionModel {
    var booksSection: [BooksSectionModel]
}

struct BooksSectionModel {
    let nameSection: String
    let listBooks: [BookModel]
}
