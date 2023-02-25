//
//  PrefaceViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 25/02/2023.
//

import UIKit

class PrefaceViewController: UIViewController {

    @IBOutlet weak var prefaceImage: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topLabel.text = "Çevirinin Öyküsü"
        bottomLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }
    

   

}
