//
//  ContinueViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 02/03/2023.
//

import UIKit


class ContinueViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //var selectedVerseId: Int = 0
    var verses = DataLoader().verseData
    var selectedVerses: [Verse] = []
    var verseInfoData = DataLoader().verseInfoData
    var verseViewVC = VerseViewController()

    let saveSelectedId: Int = 0
    
    // Retrieve the selected verseId from user defaults
    var selectedVerseId = UserDefaults.standard.integer(forKey: "selectedVerseId")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // selectedVerseId gets the data in title set the table view and save the tableview last viewed data
        
        selectedVerses = verses.filter { $0.sureId == selectedVerseId }
        
        for verse in verseInfoData {
            let verseName = verse.verseName
            if selectedVerseId == verse.verseId {
                self.title = verseName
            }
        }
        
        
        // Retrieve the last viewed row index from UserDefaults
        let lastViewedRowIndex = UserDefaults.standard.integer(forKey: "lastViewedRowIndex")
        
        // Set the initial selected row for the table view
        let indexPath = IndexPath(row: lastViewedRowIndex, section: 0)
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        
        
        checkAndPopToMainIfNeeded()
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
   
    }
    
    func checkAndPopToMainIfNeeded() {
        if selectedVerseId == 0 {
            
            let alert = UIAlertController(title: "No verse selected", message: "You need to select a verse before coming to this view.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
            // If selectedId is empty, show a message to the user to select a verse
            
        } else {
            print(selectedVerseId)
        }
    }
    
}


// MARK: - UITableView

extension ContinueViewController: UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedVerses.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! ContinueViewCell
        
        let verses = selectedVerses[indexPath.row]
        
        cell.verseIdLabel.text = verses.id
        cell.verseLabel.text = verses.ayetValue
        cell.verseInfoLabel.text = verses.note

        return cell
        
        
    }
}
