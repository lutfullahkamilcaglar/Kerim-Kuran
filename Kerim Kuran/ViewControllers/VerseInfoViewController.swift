//
//  VerseViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit
import Fuse

class VerseInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var infoData = DataLoader().verseInfoData
    var filteredVerseInfoData = [VerseInfo]()
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
                NSAttributedString.Key.foregroundColor: UIColor.red
            ]
            
            let verseName = self.infoData.map {$0.verseName }
            let verseId = self.infoData.map { String($0.verseId) }
            
            var combinedVerses = [String]()
            for (index, verse) in verseName.enumerated() {
                let combinedVerse = "\(verseId[index]) - \(verse)"
                combinedVerses.append(combinedVerse)
            }
            
            let verseResults = self.fuse.search(searchText, in: combinedVerses)
            
            var filteredData = [NSMutableAttributedString]()
            var filteredVerseInfoData = [VerseInfo]()
            
            for (index, _, matchedRanges) in verseResults {
                
                let verseInfoData = self.infoData[index]
                
                let attributedString = NSMutableAttributedString(string: combinedVerses[index])
                if !matchedRanges.isEmpty {
                    let nsRanges = matchedRanges.map(Range.init).map(NSRange.init)
                    for nsRange in nsRanges {
                        attributedString.addAttributes(boldAttrs, range: nsRange)
                    }
                }
                filteredData.append(attributedString)
                filteredVerseInfoData.append(verseInfoData)
            }

            // This dispatch queue added for after reloading the
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
            DispatchQueue.main.async {
                self.NSfilteredData = filteredData
                self.filteredVerseInfoData = filteredVerseInfoData
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
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
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
                let verseId: Int

                let isSearchActive = searchController.isActive && searchController.searchBar.text != ""
                
                if isSearchActive {
                    verseId = filteredVerseInfoData[index].verseId
                } else {
                    verseId = infoData[index].verseId
                }
                
                destinationViewController.selectedVerseId = verseId
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showVerse", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return NSfilteredData.count
        }
        return infoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! VerseInfoCell
        
        let verseInfoData: VerseInfo
        let headerText: NSAttributedString
        
        let isSearchActive = searchController.isActive && searchController.searchBar.text != ""
        
        if isSearchActive {
            verseInfoData = filteredVerseInfoData[indexPath.row]
            headerText = NSfilteredData[indexPath.row]
        } else{
            verseInfoData = infoData[indexPath.row]
            headerText = NSAttributedString(string: String(verseInfoData.verseId) + " - " + verseInfoData.verseName)
        }
        
        cell.verseHeaderLabel.attributedText = headerText
        cell.verseLabel.text = verseInfoData.verseInfo
        
        return cell
    }
}




