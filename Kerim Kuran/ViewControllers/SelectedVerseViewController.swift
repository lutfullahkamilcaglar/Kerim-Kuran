//
//  SelectedVerseViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import UIKit
import Fuse

class SelectedVerseViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    var data = DataLoader().verseData
    var filteredData = [VerseData]()
    var NSfilteredData = [NSAttributedString]()
    let fuse = Fuse()
    
    // MARK: - View Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        navigationItem.searchController = searchController
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Arama"
        
        // Setup the TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Search Text Arrangement
    
    func filterContentForSearchText(_ searchText: String) {
        let boldAttrs = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ]
        let ayetValue = data.map { $0.ayetValue }
        let results = fuse.search(searchText, in: ayetValue)
        
        NSfilteredData = results.map { (index, _, matchedRanges) in
            let verse = data[index].ayetValue
            
            let attributedString = NSMutableAttributedString(string: verse)
            matchedRanges
                .map(Range.init)
                .map(NSRange.init)
                .forEach {
                    attributedString.addAttributes(boldAttrs, range: $0)
                }
            return attributedString
        }
        tableView.reloadData()
    }
    
}

// MARK: - UISearchBar Delegate
extension SelectedVerseViewController: UISearchBarDelegate {
func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!)
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension SelectedVerseViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}


// MARK: - UITableView
    
extension SelectedVerseViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return NSfilteredData.count
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! SelectedVerseCell
        let item: NSAttributedString
        
        if searchController.isActive && searchController.searchBar.text != ""  {
            item = NSfilteredData[indexPath.row]
        }else{
            let verseLabel = data[indexPath.row]
            item = NSAttributedString(string: verseLabel.id + " " + verseLabel.ayetValue )
        }
        cell.SVerseLabel.attributedText =  item
        return cell
    }
}
