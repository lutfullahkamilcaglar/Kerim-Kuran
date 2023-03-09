//
//  ContinueViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 02/03/2023.
//

import UIKit


class ContinueViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var verses = DataLoader().verseData
    var selectedVerses: [Verse] = []
    var verseInfoData = DataLoader().verseInfoData
    var verseViewVC = VerseViewController()
    
    // Retrieve the data from user defaults
    var selectedVerseId = UserDefaults.standard.integer(forKey: "selectedVerseId")
    var lastVisibleRowIndex = UserDefaults.standard.integer(forKey: "lastVisibleRowIndex")
    

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
    
        tableView.delegate = self
        tableView.dataSource = self
        
        // Reload the table view data
        tableView.reloadData()
        
        checkStatement()
        
    }
    
    func checkStatement() {
        if selectedVerseId == 0 {
            let alert = UIAlertController(title: "Seçili ayet bulunamadı.", message: "Okumaya kaldığınız yerden devam etmek için önce bir sure seçmeniz gerekmektedir.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)}
        else{
                scrollTableView()
            }
    }
    
    func scrollTableView() {
        // Scroll the table view to the last visible row
        let indexPath = IndexPath(row: lastVisibleRowIndex, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
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

        
        // Add a long press gesture recogniser to the cell
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(copyVerse(_:)))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
        
        
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
