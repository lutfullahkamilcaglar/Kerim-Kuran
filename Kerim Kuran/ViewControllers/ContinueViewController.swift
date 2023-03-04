//
//  ContinueViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 02/03/2023.
//

import UIKit


class ContinueViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedVerseId: Int = 0
    var verses = DataLoader().verseData
    var selectedVerses: [Verse] = []
    var verseInfoData = DataLoader().verseInfoData
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
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
    
}


// MARK: - UITableView

extension ContinueViewController: UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return verses.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! ContinueViewCell
        
        let verses = verses[indexPath.row]
        
        cell.verseIdLabel.text = verses.id
        
        cell.verseLabel.text = verses.ayetValue
        cell.verseInfoLabel.text = verses.note
        
        
        return cell
        
        
    }
}
