//
//  BookCollectionViewCell.swift
//  ChallengeMarceloVelasquez
//
//  Created by Marcelo Stefano Velasquez Herrera on 3/09/21.
//

import UIKit
import SDWebImage

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardBook: UIView!
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    
    static let identifier = "BookCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "BookCollectionViewCell", bundle: nil)
    }
    
    var imgNameBook: String = "" {
        didSet {
            guard let urlImgName = URL(string: imgNameBook) else { return }
            imgBook.sd_setImage(with: urlImgName, placeholderImage: nil, options: .allowInvalidSSLCertificates, progress: nil, completed: nil)
        }
    }
    
    var bookName: String = "" {
        didSet {
            lblBookName.text = bookName
        }
    }
    
    var bookAuthor: String = "" {
        didSet {
            lblBookAuthor.text = bookAuthor
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        configureCard()
        configureBookName()
        configureBookAuthor()
    }
    
    func configureCard() {
        cardBook.backgroundColor = ColorPalette.DesignSystem.secondaryColor
        cardBook.layer.borderWidth = 2
        cardBook.layer.borderColor = UIColor.gray.cgColor
        cardBook.layer.cornerRadius = 8
    }
    
    func configureBookName() {
        lblBookName.font = UIFont(name: "Futura-Bold", size: 16)
        lblBookName.numberOfLines = 0
        lblBookName.textAlignment = .center
    }
    
    func configureBookAuthor() {
        lblBookAuthor.font = UIFont(name: "Futura-Medium", size: 14)
        lblBookAuthor.numberOfLines = 0
        lblBookAuthor.textAlignment = .center
    }

}
