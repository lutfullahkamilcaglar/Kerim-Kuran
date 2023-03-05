//
//  ContactViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 22/02/2023.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController,MFMailComposeViewControllerDelegate {

    @IBOutlet weak var firstButton  : UIButton!
    @IBOutlet weak var secondButton : UIButton!
    @IBOutlet weak var thirdButton  : UIButton!
    @IBOutlet weak var fourthButton : UIButton!
    @IBOutlet weak var fifthButton  : UIButton!
    @IBOutlet weak var sixthButton  : UIButton!
    @IBOutlet weak var seventhButton: UIButton!
    @IBOutlet weak var eighthButton : UIButton!
    
    // Button image setups
    let firstButtonImage   = UIImageView(image: UIImage(named: "firstButton"))
    let secondButtonImage  = UIImageView(image: UIImage(named: "secondButton"))
    let thirdButtonImage   = UIImageView(image: UIImage(named: "thirdButton"))
    let fourthButtonImage  = UIImageView(image: UIImage(named: "fourthButton"))
    let fifthButtonImage   = UIImageView(image: UIImage(named: "fifthButton"))
    let sixthButtonImage   = UIImageView(image: UIImage(named: "sixthButton"))
    let seventhButtonImage = UIImageView(image: UIImage(named: "seventhButton"))
    let eighthButtonImage  = UIImageView(image: UIImage(named: "eighthButton"))
    
    //Button label setups
    let firstButtonLabel   = UILabel()
    let secondButtonLabel  = UILabel()
    let thirdButtonLabel   = UILabel()
    let fourthButtonLabel  = UILabel()
    let fifthButtonLabel   = UILabel()
    let sixthButtonLabel   = UILabel()
    let seventhButtonLabel = UILabel()
    let eighthButtonLabel  = UILabel()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstButton.layer.cornerRadius = 15
        secondButton.layer.cornerRadius = 15
        self.title = "İletişim"
        
        // Button ui callers
        firstButtonUI()
        
    }
    
    // buttons setups
    
    func firstButtonUI() {
        
        var parent = self.view!
        parent.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        firstButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 20).isActive = true
        firstButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 154).isActive = true
        
        // image set
        firstButton.addSubview(firstButtonImage)
        firstButtonImage.translatesAutoresizingMaskIntoConstraints = false
        firstButtonImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        firstButtonImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        firstButtonImage.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 32).isActive = true
        firstButtonImage.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 10).isActive = true
        
        // label set
        firstButton.addSubview(firstButtonLabel)
        
        
    }
    
   
    // UIButton setups
    
    @IBAction func firstButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://www.erhanaktas.org") {
           UIApplication.shared.open(url)
        }

    }
    
    
    @IBAction func secondButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://www.facebook.com/erhanaktasankara/") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
    }
    
 
    @IBAction func thirdButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://twitter.com/erhanaktasbirr") {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
    
    }
    
    
    @IBAction func fourthButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://www.instagram.com/erhan.aktas06/") {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
        
        
    }
    
    
    @IBAction func fifthButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/user/kuranmesaji") {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
    }
    
    
    @IBAction func sixthButtonClicked(_ sender: UIButton) {

                if MFMailComposeViewController.canSendMail() {
                    let mailComposer = MFMailComposeViewController()
                    mailComposer.mailComposeDelegate = self
                    mailComposer.setToRecipients(["erhanaktas@hotmail.com"])
                    mailComposer.setSubject("Email Subject")
                    mailComposer.setMessageBody("Email Body", isHTML: false)
                    present(mailComposer, animated: true, completion: nil)
                } else {
                    print("Cannot send mail")
                }
            
            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
                controller.dismiss(animated: true, completion: nil)
            }
        
    }
    
    
    @IBAction func seventhButtonClicked(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients(["birrkbo@gmail.com"])
            mailComposer.setSubject("Email Subject")
            mailComposer.setMessageBody("Email Body", isHTML: false)
            present(mailComposer, animated: true, completion: nil)
        } else {
            print("Cannot send mail")
        }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    }
    
    
    @IBAction func eighthButtonClicked(_ sender: UIButton) {
        if let phoneUrl = URL(string: "telprompt://5522883306") {
           UIApplication.shared.open(phoneUrl)
        }

    }
    
    
}
