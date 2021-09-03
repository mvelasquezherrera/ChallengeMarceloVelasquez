//
//  HeaderBookTableViewCell.swift
//  ChallengeMarceloVelasquez
//
//  Created by Marcelo Stefano Velasquez Herrera on 3/09/21.
//

import UIKit

class HeaderBookTableViewCell: UITableViewCell {

    @IBOutlet weak var cardHeaderSection: UIView!
    @IBOutlet weak var lblTitleSection: UILabel!
    @IBOutlet weak var lblNumberBooks: UILabel!
    
    static let identifier = "HeaderBookTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HeaderBookTableViewCell", bundle: nil)
    }
    
    var titleSection: String = "" {
        didSet {
            lblTitleSection.text = titleSection
        }
    }
    
    var numberBooks: String = "" {
        didSet {
            lblNumberBooks.text = numberBooks
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        cardHeaderSection.backgroundColor = ColorPalette.DesignSystem.primaryColor
        configureTitleSection()
        configureNumberBooks()
    }
    
    func configureTitleSection() {
        lblTitleSection.font = UIFont(name: "Futura-Bold", size: 16)
        lblTitleSection.textColor = .white
        lblTitleSection.numberOfLines = 1
        lblTitleSection.textAlignment = .left
    }
    
    func configureNumberBooks() {
        lblNumberBooks.font = UIFont(name: "Futura-Bold", size: 16)
        lblNumberBooks.textColor = .white
        lblNumberBooks.numberOfLines = 1
        lblNumberBooks.textAlignment = .right
    }
    
}
