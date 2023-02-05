//
//  ViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10).isActive = true
        image.topAnchor.constraint(equalTo: button.topAnchor, constant: 10).isActive = true
        let label = UILabel()
        label.textColor = .red
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Ana Sayfa", style: .plain, target: nil, action: nil)

        button.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        
    }
    let image = UIImageView(image: UIImage(named: "testImage"))
    
    @IBAction func mybutton(_ sender: Any) {
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10).isActive = true
        image.topAnchor.constraint(equalTo: button.topAnchor, constant: 10).isActive = true

        

    }
    
}



