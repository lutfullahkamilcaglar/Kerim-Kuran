//
//  ShowVerseTestViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 03/02/2023.
//

import UIKit

class VerseViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var sureIdLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sureNameLabel: UILabel!
    
    var selectedVerseId: Int = 0
    var verses = DataLoader().verseData
    var selectedVerses: [Verse] = []
    var verseInfoData = DataLoader().verseInfoData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedVerses = verses.filter { $0.sureId == selectedVerseId }
        
        for verse in verseInfoData {
            let name = verse.verseName
            if selectedVerseId == verse.verseId {
                self.title = name
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
}

// MARK: - TableView

extension VerseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedVerses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let verse = selectedVerses[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! VerseViewCell
        cell.verseLabel.text = verse.ayetValue
        cell.verseIdLabel.text = verse.id
        return cell
    }
}
