//
//  VerseViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit

class VerseInfoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var infoData = DataLoader().verseInfoData
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
    }
}
    // MARK: - UITableView
    
extension VerseInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVerse" {
            if let destinationViewController = segue.destination as? ShowVerseTestViewController {
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! VerseCell
        cell.verseHeaderLabel.text = String(testLabel.verseId) + " - " + testLabel.verseName
        cell.verseLabel.text = testLabel.verseInfo
        cell.verseView.layer.cornerRadius = 10
        cell.verseView.translatesAutoresizingMaskIntoConstraints = false
        cell.verseView.widthAnchor.constraint(equalToConstant: 329).isActive = true
        cell.verseView.heightAnchor.constraint(equalToConstant: 136).isActive = true

        return cell
    }
}




