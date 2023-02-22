//
//  TestTableViewCell.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 03/02/2023.
//

import UIKit

class VerseViewCell: UITableViewCell {

  
    @IBOutlet weak var verseView: UIView!
    @IBOutlet weak var verseIdLabel: UILabel!
    @IBOutlet weak var verseLabel: UILabel!
    @IBOutlet weak var verseInfoLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        verseView.backgroundColor = .white
        verseView.layer.cornerRadius = 12
        verseView.layer.borderWidth = 1
        verseView.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor


    }
    
}
