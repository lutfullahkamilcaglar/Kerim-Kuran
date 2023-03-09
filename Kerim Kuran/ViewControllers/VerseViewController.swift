//
//  ShowVerseTestViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 03/02/2023.
//

import UIKit
import Fuse

class VerseViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedVerseId = 0
    var filteredDataNS = [NSAttributedString]()
    var filteredIdNS = [NSAttributedString]()
    let fuse = Fuse(distance: 700)
    let searchController = UISearchController(searchResultsController: nil)
    var verses = DataLoader().verseData
    var verseInfoData = DataLoader().verseInfoData
    var selectedVerses: [Verse] = []
    var filteredVerseData = [Verse]()
    var lastVisibleRowIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchBar.placeholder = "Ara"
        
        UserDefaults.standard.set(selectedVerseId, forKey: "selectedVerseId")
        
        UserDefaults.standard.setValue(lastVisibleRowIndex, forKey: "lastVisibleRowIndex")
        print(UserDefaults.standard.integer(forKey: "lastVisibleRowIndex")) // should print the same value as lastVisibleRowIndex

        
        // Setup the Search Controller
        navigationItem.searchController = searchController
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        selectedVerses = verses.filter { $0.sureId == selectedVerseId }
        
        for verse in verseInfoData {
            let verseName = verse.verseName
            if selectedVerseId == verse.verseId {
                self.title = verseName
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
   
    
    // MARK: - Search Text Arrangement

    func filterContentForSearchText(_ searchText: String) {
            DispatchQueue.global().async {
                let boldAttrs = [
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
                    NSAttributedString.Key.foregroundColor: UIColor.red
                ]
                
                let verseId = self.verses.map { $0.id }
                let ayetValue = self.verses.map { $0.ayetValue }
                let verseNote = self.verses.map { $0.note ?? "" }
                
                var searchItems: [String]
                var isIdSearch: Bool
                
                if let _ = Int(searchText) {
                    isIdSearch = true
                    searchItems = verseId
                } else {
                    isIdSearch = false
                    searchItems = ayetValue
                }
                
                var combinedVerses = [String]()
                for (index, id) in verseId.enumerated() {
                    let combinedVerse = "\(id) - \(ayetValue[index]) - \(verseNote[index])"
                    combinedVerses.append(combinedVerse)
                }
                
                let results = self.fuse.search(searchText, in: searchItems)
                
                
                var filteredData = [NSMutableAttributedString]()
                var filteredVerseData = [Verse]()
        
                for (index, _, matchedRanges) in results.prefix(100) {
                    
                    let verseData = self.verses[index]
                    
                    let attributedString = NSMutableAttributedString(string: searchItems[index])
                    if !matchedRanges.isEmpty {
                        let nsRanges = matchedRanges.map(Range.init).map(NSRange.init)
                        for nsRange in nsRanges {
                            attributedString.addAttributes(boldAttrs, range: nsRange)
                        }
                    }
                    
                    filteredData.append(attributedString)
                    filteredVerseData.append(verseData)
                }
                
                DispatchQueue.main.async {
                    if (isIdSearch) {
                        self.filteredIdNS = filteredData
                    } else {
                        self.filteredDataNS = filteredData
                    }
                    self.filteredVerseData = filteredVerseData
                    self.tableView.reloadData()
                }
            }
        }
}

// MARK: - TableView

extension VerseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" && !filteredVerseData.isEmpty {
            if let _ = Int(searchController.searchBar.text!) {
                return filteredIdNS.count
            } else {
                return filteredDataNS.count
            }
        } else{
            return selectedVerses.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! VerseViewCell
        
        let labelVerseData: Verse
        let verseLabelData: NSAttributedString
        let verseIdData: NSAttributedString
        
        let isSearchActive = searchController.isActive && !searchController.searchBar.text!.isEmpty && !filteredVerseData.isEmpty
        
        if isSearchActive {
            labelVerseData = self.filteredVerseData[indexPath.row]
            if let _ = Int(searchController.searchBar.text!) {
                verseIdData = filteredIdNS[indexPath.row]
                verseLabelData = NSAttributedString(string: labelVerseData.ayetValue)
            } else {
                verseLabelData = filteredDataNS[indexPath.row]
                verseIdData = NSAttributedString(string: labelVerseData.id)
            }
        } else {
            labelVerseData = self.selectedVerses[indexPath.row]
            verseLabelData = NSAttributedString(string: labelVerseData.ayetValue)
            verseIdData = NSAttributedString(string: labelVerseData.id)
        }
        
        cell.verseIdLabel.attributedText = verseIdData
        cell.verseLabel.attributedText = verseLabelData
        cell.verseInfoLabel.text = labelVerseData.note
    
        // Add a long press gesture recogniser to the cell
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(copyVerse(_:)))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            lastVisibleRowIndex = findLastVisibleRowIndex() ?? 0
            UserDefaults.standard.setValue(lastVisibleRowIndex, forKey: "lastVisibleRowIndex")
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        lastVisibleRowIndex = findLastVisibleRowIndex() ?? 0
        UserDefaults.standard.setValue(lastVisibleRowIndex, forKey: "lastVisibleRowIndex")
    }

    func findLastVisibleRowIndex() -> Int? {
        let bottomEdge = tableView.contentOffset.y + tableView.frame.size.height
        let indexPaths = tableView.indexPathsForVisibleRows?.sorted(by: { $0.row < $1.row })
        var lastVisibleIndex: Int?
        for indexPath in indexPaths ?? [] {
            if tableView.rectForRow(at: indexPath).maxY > bottomEdge {
                break
            }
            lastVisibleIndex = indexPath.row
        }
        return lastVisibleIndex
    }
    
    
    @objc func copyVerse(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            // Retrieve the selected row
            let point = gestureRecognizer.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: point) {
                let verse = selectedVerses[indexPath.row]
                let lowerCasedVerseName = verse.name.prefix(1).capitalized + verse.name.dropFirst().lowercased()
                // Copy the verse contents to the clipboard
                let pasteboard = UIPasteboard.general
                pasteboard.string = "\(lowerCasedVerseName) Suresi\n\n \(verse.id)\n \(verse.ayetValue)\n\n \(verse.note ?? "")"
                
                // Show an alert to confirm the copy operation
                let alertController = UIAlertController(title: "Panoya kopyalandı", message: "\(lowerCasedVerseName) Suresi\n \(verse.id)\n \(verse.ayetValue)\n \(verse.note ?? "")", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
}




// MARK: - UISearchBar Delegate
extension VerseViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}


// MARK: - UISearchResultsUpdating Delegate

extension VerseViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
       
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
    }
}

