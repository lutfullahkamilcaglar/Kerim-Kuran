//
//  SelectedVerseCell.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import UIKit


class SelectedVerseCell: UITableViewCell {

    @IBOutlet weak var SVerseLabel: UILabel!
    @IBOutlet weak var SverseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // ui updates
        SVerseLabel.sizeToFit()
        SVerseLabel.numberOfLines = 0
        SverseView.backgroundColor = .white
        SverseView.layer.backgroundColor = UIColor(red: 0.239, green: 0.443, blue: 0.447, alpha: 1).cgColor
        SverseView.layer.cornerRadius = 10
        SverseView.translatesAutoresizingMaskIntoConstraints = false
        
        // Button Target
        
        
        

    }

}

