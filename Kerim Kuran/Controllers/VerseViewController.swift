//
//  VerseViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit

class VerseViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
    }
    
}

    // MARK: - UITableView
    
extension VerseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let testLabel = labelData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! VerseCell
        cell.verseHeaderLabel.text = testLabel.topLabel
        cell.verseLabel.text = testLabel.label
        cell.verseView.layer.cornerRadius = 10
        cell.verseView.translatesAutoresizingMaskIntoConstraints = false
        cell.verseView.widthAnchor.constraint(equalToConstant: 329).isActive = true
        cell.verseView.heightAnchor.constraint(equalToConstant: 136).isActive = true
       // cell.verseView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 32).isActive = true
        //cell.verseView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 134).isActive = true

        return cell
    }
}




