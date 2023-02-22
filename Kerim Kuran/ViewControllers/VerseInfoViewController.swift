//
//  VerseViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit
import Fuse

class VerseInfoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var infoData = DataLoader().verseInfoData
    let searchController = UISearchController(searchResultsController: nil)
    var data = DataLoader().verseData
    var NSfilteredData = [NSAttributedString]()
    let fuse = Fuse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        self.title = "Tüm Sureler"
        searchController.searchBar.placeholder = "Arama"
        
        // Setup the Search Controller
        navigationItem.searchController = searchController
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        
    }

    // MARK: - Search Text Arrangement
    
    func filterContentForSearchText(_ searchText: String) {
        DispatchQueue.global().async {
            let boldAttrs = [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
                NSAttributedString.Key.foregroundColor: UIColor.darkText
            ]
            let ayetValue = self.data.map { $0.ayetValue }
            let results = self.fuse.search(searchText, in: ayetValue)
            
            var filteredData = [NSMutableAttributedString]()
            for (index, _, matchedRanges) in results {
                let value = self.data[index]
                let verse = value.ayetValue
                let attributedString = NSMutableAttributedString(string: verse)
                if !matchedRanges.isEmpty {
                    let nsRanges = matchedRanges.map(Range.init).map(NSRange.init)
                    for nsRange in nsRanges {
                        attributedString.addAttributes(boldAttrs, range: nsRange)
                    }
                }
                filteredData.append(attributedString)
            }
            // This dispatch queue added for after reloading the
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            DispatchQueue.main.async {
                self.NSfilteredData = filteredData
                self.tableView.reloadData()
            }
        }
    }
}


// MARK: - UISearchBar Delegate
extension VerseInfoViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
        
    }
}

// MARK: - UISearchResultsUpdating Delegate

extension VerseInfoViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
}


    // MARK: - UITableView
    
extension VerseInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVerse" {
            if let destinationViewController = segue.destination as? VerseViewController {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let index = indexPath.row
                let verseId = infoData[index].verseId
                destinationViewController.selectedVerseId = verseId
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showVerse", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let testLabel = infoData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! VerseInfoCell
        cell.verseHeaderLabel.text = String(testLabel.verseId) + " - " + testLabel.verseName
        cell.verseLabel.text = testLabel.verseInfo

        return cell
    }
}




