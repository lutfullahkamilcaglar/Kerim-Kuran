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
    
    let firstButtonImage    = UIImageView(image: UIImage(named: "button1"))
    let secondButtonImage = UIImageView(image: UIImage(named: "button2"))
    let thirdButtonImage  = UIImageView(image: UIImage(named: "button3"))
    let fourthButtonImage    = UIImageView(image: UIImage(named: "button4"))
    
    //Button label setups
    let verseButtonLabel     = UILabel()
    let continueButtonLabel  = UILabel()
    let prefaceButtonLabel   = UILabel()
    let aboutButtonLabel     = UILabel()
    let contactButtonLabel   = UILabel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "İletişim"
        //firstButtonUI()
    }
  
    
   
    // UIButton setups
    func firstButtonUI() {
        firstButton.addSubview(firstButtonImage)
    }
    
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
