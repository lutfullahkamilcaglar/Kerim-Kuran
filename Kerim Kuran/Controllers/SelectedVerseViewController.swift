//
//  SelectedVerseViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import UIKit

class SelectedVerseViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let data = DataLoader().verseData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }
        
}
// MARK: - UITableView
    
extension SelectedVerseViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let verseLabel = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! SelectedVerseCell
        
        cell.SVerseLabel.text = verseLabel.id + " " + verseLabel.ayetValue
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}



