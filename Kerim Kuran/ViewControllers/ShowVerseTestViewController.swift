//
//  ShowVerseTestViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 03/02/2023.
//

import UIKit

class ShowVerseTestViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedVerseId: Int = 0
    var verses = DataLoader().verseData
    var selectedVerses: [Verse] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedVerses = verses.filter { $0.sureId == selectedVerseId }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
    }
    
}

// MARK: - TableView

extension ShowVerseTestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedVerses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let verse = selectedVerses[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TestTableViewCell
        cell.label.text = verse.ayetValue

        return cell
    }
}
