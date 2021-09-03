//
//  BooksViewController.swift
//  ChallengeMarceloVelasquez
//
//  Created by Marcelo Stefano Velasquez Herrera on 3/09/21.
//

import UIKit

class BooksViewController: UIViewController {
    
    @IBOutlet weak var booksTable: UITableView!
    
    private var booksViewModel: BooksViewModel!
    
    private var listBooks: [BookModel] = []
    private var listBooksBestSellers: [BookModel] = []
    private var listBooksHistory: [BookModel] = []
    private var listBooksScience: [BookModel] = []
    private var listBooksBusiness: [BookModel] = []
    
    private var listBooksBestSellersFilter: [String] = []
    
    var listBooksSection: ListBookSectionModel = ListBookSectionModel(booksSection: [BooksSectionModel(nameSection: "", listBooks: [BookModel(isbn: "", title: "", author: "", description: "", genre: "", img: "", imported: false)])])

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        configureUI()
    }
    
    func configureUI() {
        configureNavigation()
        configureBooksTable()
    }
    
    func configureNavigation() {
        title = "Books"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont(name: "Futura-Bold", size: 16)!,
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func configureBooksTable() {
        booksTable.delegate = self
        booksTable.dataSource = self
        booksTable.rowHeight = UITableView.automaticDimension
        booksTable.separatorStyle = .none
        booksTable.register(HeaderBookTableViewCell.nib(), forCellReuseIdentifier: HeaderBookTableViewCell.identifier)
        booksTable.register(BooksTableViewCell.nib(), forCellReuseIdentifier: BooksTableViewCell.identifier)
        booksTable.layoutIfNeeded()
        booksTable.backgroundColor = .white
    }
    
    func callToViewModelForUIUpdate(){
        
        self.booksViewModel =  BooksViewModel()
        self.booksViewModel.bindBooksViewModelToController = {
            self.updateData()
            
        }
        
    }
    
    func updateData(){
        DispatchQueue.main.async {
            
            self.listBooksSection.booksSection.removeAll()
            self.listBooksBestSellers.removeAll()
            self.listBooksHistory.removeAll()
            self.listBooksScience.removeAll()
            self.listBooksBusiness.removeAll()
            
            guard let listBooksData = self.booksViewModel.booksData else {
                return
            }
            
            self.listBooks = listBooksData.results.books
            
            guard let listBooksBestSellersData = self.self.booksViewModel.booksBestSellersData else {
                return
            }
            
            self.listBooksBestSellersFilter = listBooksBestSellersData.results.best_sellers
            
            
            for item in self.listBooks {
                
                switch item.genre {
                case "History":
                    self.listBooksHistory.append(item)
                    
                case "Science":
                    self.listBooksScience.append(item)
                    
                case "Business":
                    self.listBooksBusiness.append(item)
                default:
                    break
                }
                
                for index in self.listBooksBestSellersFilter {
                    if index == item.isbn {
                        self.listBooksBestSellers.append(item)
                    }
                }
                
            }
            
            self.listBooksSection.booksSection.append(BooksSectionModel(nameSection: "Best Sellers", listBooks: self.listBooksBestSellers))
            self.listBooksSection.booksSection.append(BooksSectionModel(nameSection: "Historia", listBooks: self.listBooksHistory))
            self.listBooksSection.booksSection.append(BooksSectionModel(nameSection: "Ciencia", listBooks: self.listBooksScience))
            self.listBooksSection.booksSection.append(BooksSectionModel(nameSection: "Negocios", listBooks: self.listBooksBusiness))
            
            self.booksTable.reloadData()
            
        }
        
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listBooksSection.booksSection.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "HeaderBookTableViewCell") as! HeaderBookTableViewCell
        
        let dataHeader = listBooksSection.booksSection[section]
        
        header.titleSection = dataHeader.nameSection
        
        if dataHeader.listBooks.count == 1 {
            header.numberBooks = "\(dataHeader.listBooks.count) Libro"
        } else {
            header.numberBooks = "\(dataHeader.listBooks.count) Libros"
        }
        
        return header
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksTableViewCell", for: indexPath) as! BooksTableViewCell
        
        cell.listBooksSection = listBooksSection
        cell.sectionTable = indexPath.section
        
        cell.booksCollection.reloadData()
        
        return cell
        
    }
    
}
