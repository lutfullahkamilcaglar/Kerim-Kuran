//
//  ContinueViewCell.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 02/03/2023.
//

import UIKit

class ContinueViewCell: UITableViewCell {

    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var verseIdLabel: UILabel!
    @IBOutlet weak var verseLabel: UILabel!
    @IBOutlet weak var verseInfoLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       labelView.backgroundColor = .white
       labelView.layer.cornerRadius = 12
       labelView.layer.borderWidth = 1
       labelView.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor
        
    }

}
