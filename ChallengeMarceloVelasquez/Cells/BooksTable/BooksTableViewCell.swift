//
//  BooksTableViewCell.swift
//  ChallengeMarceloVelasquez
//
//  Created by Marcelo Stefano Velasquez Herrera on 3/09/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var booksCollection: UICollectionView!
    
    static let identifier = "BooksTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "BooksTableViewCell", bundle: nil)
    }
    
    var listBooksSection: ListBookSectionModel = ListBookSectionModel(booksSection: [BooksSectionModel(nameSection: "", listBooks: [BookModel(isbn: "", title: "", author: "", description: "", genre: "", img: "", imported: false)])])
    
    var sectionTable = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        configureBooksCollection()
    }
    
    func configureBooksCollection() {
        booksCollection.delegate = self
        booksCollection.dataSource = self
        booksCollection.register(BookCollectionViewCell.nib(), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        booksCollection.layoutIfNeeded()
        booksCollection.backgroundColor = ColorPalette.DesignSystem.secondaryColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension BooksTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBooksSection.booksSection[sectionTable].listBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        let data = listBooksSection.booksSection[sectionTable].listBooks[indexPath.row]
        
        cell.imgNameBook = data.img
        cell.bookName = data.title
        cell.bookAuthor = data.author
        
        return cell
        
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BooksTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
}
