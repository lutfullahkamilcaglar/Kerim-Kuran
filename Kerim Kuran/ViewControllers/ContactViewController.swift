//
//  ContactViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 22/02/2023.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var firstButton  : UIButton!
    @IBOutlet weak var secondButton : UIButton!
    @IBOutlet weak var thirdButton  : UIButton!
    @IBOutlet weak var fourthButton : UIButton!
    @IBOutlet weak var fifthButton  : UIButton!
    @IBOutlet weak var sixthButton  : UIButton!
    @IBOutlet weak var seventhButton: UIButton!
    @IBOutlet weak var eighthButton : UIButton!
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstButton.layer.cornerRadius = 15
        secondButton.layer.cornerRadius = 15
        self.title = "İletişim"
        
        
    }
    
   
    // UIButton setups
    
    @IBAction func firstButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://www.erhanaktas.org") {
           UIApplication.shared.open(url)
        }

    }
    
    
    @IBAction func secondButtonClicked(_ sender: UIButton) {
    }
    
 
    @IBAction func thirdButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func fourthButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func fifthButtonClicked(_ sender: UIButton) {
        
    }
    
    
    @IBAction func sixthButtonClicked(_ sender: UIButton) {
        
    }
    
    
    @IBAction func seventhButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func eighthButtonClicked(_ sender: UIButton) {
        if let phoneUrl = URL(string: "telprompt://5522883306") {
           UIApplication.shared.open(phoneUrl)
        }

    }
    
    
}
