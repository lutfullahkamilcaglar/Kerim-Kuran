//
//  SelectedVerseViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import UIKit

class SelectedVerseViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    var data = DataLoader().verseData
    var searching = false
    var filteredData = DataLoader().verseData
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        tableView.delegate = self
        tableView.dataSource = self
        searchController.loadViewIfNeeded()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        tableView.reloadData()
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Arama"
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        if let indexPath = tableView.indexPathForSelectedRow {
            UserDefaults.standard.set(indexPath.row, forKey: "lastViewedRow")
            UserDefaults.standard.set(indexPath.section, forKey: "lastViewedSection")
            tableView.reloadData()
        }
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        let row = UserDefaults.standard.integer(forKey: "lastViewedRow")
        let section = UserDefaults.standard.integer(forKey: "lastViewedSection")
        let indexPath = IndexPath(row: row, section: section)
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        tableView.reloadData()
    }

}
// MARK: - UITableView And SearchTextField Configuration
    
extension SelectedVerseViewController: UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return filteredData.count
        }else{
            return data.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! SelectedVerseCell
        if searching {
            let verseLabel = filteredData[indexPath.row]
            cell.SVerseLabel.text = verseLabel.id + " " + verseLabel.ayetValue
        }else{
            let verseLabel = data[indexPath.row]
            cell.SVerseLabel.text = verseLabel.id + " " + verseLabel.ayetValue
        }
        return cell
    }

    func searhBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        filteredData.removeAll()
        tableView.reloadData()
    }

    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text!
        if !text.isEmpty {
            searching = true
            filteredData.removeAll()
            let components = text.components(separatedBy: CharacterSet.alphanumerics.inverted)
            let strippedText = components.joined(separator: "").lowercased(with: Locale(identifier: "tr_TR"))
            for verse in data {
                if verse.ayetValue.lowercased(with: Locale(identifier: "tr_TR")).contains(strippedText) {
                    filteredData.append(verse)
                }
            }
        } else {
            searching = false
            filteredData.removeAll()
            filteredData = data
        }
        self.tableView.reloadData()
    }

}


