//
//  ViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit
import Fuse

class MainViewController: UIViewController {
    
    var infoData = DataLoader().verseInfoData
    let searchController = UISearchController(searchResultsController: nil)
    var data = DataLoader().verseData
    var NSfilteredData = [NSAttributedString]()
    let fuse = Fuse()
    
    
    @IBOutlet weak var allVerseButton:  UIButton!
    @IBOutlet weak var continueButton:  UIButton!
    @IBOutlet weak var prefaceButton:   UIButton!
    @IBOutlet weak var aboutButton:     UIButton!
    @IBOutlet weak var contactButton:   UIButton!
    
    //Buttons image setups
    let verseButtonImage    = UIImageView(image: UIImage(named: "showVerseIcon"))
    let continueButtonImage = UIImageView(image: UIImage(named: "continueIcon"))
    let prefaceButtonImage  = UIImageView(image: UIImage(named: "foreIcon"))
    let aboutButtonImage    = UIImageView(image: UIImage(named: "birPlatformIcon"))
    
    //Button label setups
    let verseButtonLabel     = UILabel()
    let continueButtonLabel  = UILabel()
    let prefaceButtonLabel   = UILabel()
    let aboutButtonLabel     = UILabel()
    let contactButtonLabel   = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Ana Sayfa", style: .plain, target: nil, action: nil)
        
        // Setup the Search Controller
        navigationItem.searchController = searchController
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        VerseButtonView()
        continueButtonView()
        prefaceButtonView()
        aboutButtonView()
        contactButtonView()
    }
    
    // MARK: - Search Text Arrangement
    
//    func filterContentForSearchText(_ searchText: String) {
//        DispatchQueue.global().async {
//            let boldAttrs = [
//                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
//                NSAttributedString.Key.foregroundColor: UIColor.darkText
//            ]
//            let ayetValue = self.data.map { $0.ayetValue }
//            let results = self.fuse.search(searchText, in: ayetValue)
//
//            var filteredData = [NSMutableAttributedString]()
//            for (index, _, matchedRanges) in results {
//                let value = self.data[index]
//                let verse = value.ayetValue
//                let attributedString = NSMutableAttributedString(string: verse)
//                if !matchedRanges.isEmpty {
//                    let nsRanges = matchedRanges.map(Range.init).map(NSRange.init)
//                    for nsRange in nsRanges {
//                        attributedString.addAttributes(boldAttrs, range: nsRange)
//                    }
//                }
//                filteredData.append(attributedString)
//            }
//            // This dispatch queue added for after reloading the
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//            DispatchQueue.main.async {
//                self.NSfilteredData = filteredData
//                self.tableView.reloadData()
//            }
//        }
//    }
    

    func VerseButtonView() {
        //button image setup
        allVerseButton.layer.cornerRadius = 15
        allVerseButton.addSubview(verseButtonImage)
        verseButtonImage.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        verseButtonImage.translatesAutoresizingMaskIntoConstraints = false
        verseButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        verseButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        verseButtonImage.leadingAnchor.constraint(equalTo: allVerseButton.leadingAnchor, constant: 22).isActive = true
        verseButtonImage.topAnchor.constraint(equalTo: allVerseButton.topAnchor, constant: 22).isActive = true
    
        //button label setup
        allVerseButton.addSubview(verseButtonLabel)
        verseButtonLabel.frame = CGRect(x: 0, y: 0, width: 121, height: 56)
        verseButtonLabel.numberOfLines = 0
        verseButtonLabel.lineBreakMode = .byWordWrapping
        verseButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        verseButtonLabel.text = "Tüm Sureleri gör"
        verseButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        verseButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        verseButtonLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        verseButtonLabel.leadingAnchor.constraint(equalTo: allVerseButton.leadingAnchor, constant: 22).isActive = true
        verseButtonLabel.topAnchor.constraint(equalTo: allVerseButton.topAnchor, constant: 86).isActive = true
        
        //button view set
        allVerseButton.layer.cornerRadius = 12
        allVerseButton.layer.borderWidth = 1
        allVerseButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

    }
    
    func continueButtonView() {
        //button image setup
        continueButton.layer.cornerRadius = 15
        continueButton.addSubview(continueButtonImage)
        continueButtonImage.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        continueButtonImage.translatesAutoresizingMaskIntoConstraints = false
        continueButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        continueButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        continueButtonImage.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor, constant: 22).isActive = true
        continueButtonImage.topAnchor.constraint(equalTo: continueButton.topAnchor, constant: 22).isActive = true
        continueButtonImage.backgroundColor = .white

        
        //button label setup
        continueButton.addSubview(continueButtonLabel)
        continueButtonLabel.frame = CGRect(x: 0, y: 0, width: 121, height: 56)
        continueButtonLabel.numberOfLines = 0
        continueButtonLabel.lineBreakMode = .byWordWrapping
        continueButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        continueButtonLabel.text = "Okumaya Devam et"
        continueButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        continueButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        continueButtonLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        continueButtonLabel.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor, constant: 22).isActive = true
        continueButtonLabel.topAnchor.constraint(equalTo: continueButton.topAnchor, constant: 87).isActive = true
        
        //button view set
        continueButton.layer.cornerRadius = 12
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

        
    }
    
    func prefaceButtonView() {
        //button image setup
        prefaceButton.layer.cornerRadius = 15
        prefaceButton.addSubview(prefaceButtonImage)
        prefaceButtonImage.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        prefaceButtonImage.translatesAutoresizingMaskIntoConstraints = false
        prefaceButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        prefaceButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        prefaceButtonImage.leadingAnchor.constraint(equalTo: prefaceButton.leadingAnchor, constant: 22).isActive = true
        prefaceButtonImage.topAnchor.constraint(equalTo: prefaceButton.topAnchor, constant: 22).isActive = true
        prefaceButtonImage.backgroundColor = .white

        
        //button label setup
        prefaceButton.addSubview(prefaceButtonLabel)
        prefaceButtonLabel.frame = CGRect(x: 0, y: 0, width: 121, height: 30)
        prefaceButtonLabel.numberOfLines = 0
        prefaceButtonLabel.lineBreakMode = .byWordWrapping
        prefaceButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        prefaceButtonLabel.text = "Önsöz"
        prefaceButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        prefaceButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        prefaceButtonLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        prefaceButtonLabel.leadingAnchor.constraint(equalTo: prefaceButton.leadingAnchor, constant: 22).isActive = true
        prefaceButtonLabel.topAnchor.constraint(equalTo: prefaceButton.topAnchor, constant: 98).isActive = true
        
        
        //button view set
        prefaceButton.layer.cornerRadius = 12
        prefaceButton.layer.borderWidth = 1
        prefaceButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

        
    }
    
    func aboutButtonView() {
        //button image setup
        aboutButton.layer.cornerRadius = 15
        aboutButton.addSubview(aboutButtonImage)
        aboutButtonImage.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        aboutButtonImage.translatesAutoresizingMaskIntoConstraints = false
        aboutButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        aboutButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        aboutButtonImage.leadingAnchor.constraint(equalTo: aboutButton.leadingAnchor, constant: 22).isActive = true
        aboutButtonImage.topAnchor.constraint(equalTo: aboutButton.topAnchor, constant: 22).isActive = true
        aboutButtonImage.backgroundColor = .white

        
        //button label setup
        aboutButton.addSubview(aboutButtonLabel)
        aboutButtonLabel.frame = CGRect(x: 0, y: 0, width: 121, height: 30)
        aboutButtonLabel.numberOfLines = 0
        aboutButtonLabel.lineBreakMode = .byWordWrapping
        aboutButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        aboutButtonLabel.text = "BİRR Platformu"
        aboutButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        aboutButtonLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        aboutButtonLabel.leadingAnchor.constraint(equalTo: aboutButton.leadingAnchor, constant: 22).isActive = true
        aboutButtonLabel.topAnchor.constraint(equalTo: aboutButton.topAnchor, constant: 85).isActive = true
        
        
        //button view set
        aboutButton.layer.cornerRadius = 12
        aboutButton.layer.borderWidth = 1
        aboutButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

    }
    
    func contactButtonView() {
        //button setup
        contactButton.layer.cornerRadius = 12
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.widthAnchor.constraint(equalToConstant: 349).isActive = true
        contactButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        contactButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        contactButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        contactButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 560).isActive = true
        contactButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        
        
        //button label setup
        contactButton.addSubview(contactButtonLabel)
        contactButtonLabel.numberOfLines = 0
        contactButtonLabel.lineBreakMode = .byWordWrapping
        contactButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        contactButtonLabel.text = "İletişim"
        contactButtonLabel.textColor = .white
        contactButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        contactButtonLabel.widthAnchor.constraint(equalToConstant: 73).isActive = true
        contactButtonLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        contactButtonLabel.centerXAnchor.constraint(equalTo: contactButton.centerXAnchor).isActive = true
        contactButtonLabel.centerYAnchor.constraint(equalTo: contactButton.centerYAnchor).isActive = true

        
        //button view set
        contactButton.layer.cornerRadius = 12
        contactButton.layer.borderWidth = 1
        contactButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

    }
    
}


// MARK: - UISearchBar Delegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
       // filterContentForSearchText(searchBar.text!)
        
    }
}

// MARK: - UISearchResultsUpdating Delegate

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
      //  filterContentForSearchText(searchController.searchBar.text!)
        
    }
}




