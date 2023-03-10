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
    let fifthButtonImage = UIImageView(image: UIImage(named: "button5"))
    let sixthButtonImage = UIImageView(image: UIImage(named: "button6"))
    let seventhButtonImage = UIImageView(image: UIImage(named: "button7"))
    let eighthButtonImage = UIImageView(image: UIImage(named: "button8"))
    
    //Button label setups
    let firstButtonLabel     = UILabel()
    let secondButtonLabel  = UILabel()
    let thirdButtonLabel   = UILabel()
    let fourthButtonLabel     = UILabel()
    let fifthButtonLabel   = UILabel()
    let sixthButtonLabel = UILabel()
    let seventhButtonLabel = UILabel()
    let eighthButtonLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "İletişim"
        buttonsUI()
    }
  
    
   
    // UIButton setups
    func buttonsUI() {
        firstButton.addSubview(firstButtonImage)
        secondButton.addSubview(secondButtonImage)
        thirdButton.addSubview(thirdButtonImage)
        fourthButton.addSubview(fourthButtonImage)
        fifthButton.addSubview(fifthButtonImage)
        sixthButton.addSubview(sixthButtonImage)
        seventhButton.addSubview(seventhButtonImage)
        eighthButton.addSubview(eighthButtonImage)
        
        // first button
        firstButton.addSubview(firstButtonLabel)
        firstButtonLabel.textColor = UIColor.blue
        firstButtonLabel.attributedText = NSAttributedString(string: "www.erhanaktas.org", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        firstButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        firstButtonLabel.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 106).isActive = true
        firstButtonLabel.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 16).isActive = true
        
        // second button
        secondButton.addSubview(secondButtonLabel)
        secondButtonLabel.textColor = UIColor.blue
        secondButtonLabel.attributedText = NSAttributedString(string: "@erhanaktasankara", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        secondButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        secondButtonLabel.leadingAnchor.constraint(equalTo: secondButton.leadingAnchor, constant: 106).isActive = true
        secondButtonLabel.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 16).isActive = true
        
        // third button
        thirdButton.addSubview(thirdButtonLabel)
        thirdButtonLabel.textColor = UIColor.blue
        thirdButtonLabel.attributedText = NSAttributedString(string: "@erhanaktasbirr", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        thirdButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdButtonLabel.leadingAnchor.constraint(equalTo: thirdButton.leadingAnchor, constant: 106).isActive = true
        thirdButtonLabel.topAnchor.constraint(equalTo: thirdButton.topAnchor, constant: 16).isActive = true
        
        // fourth button
        fourthButton.addSubview(fourthButtonLabel)
        fourthButtonLabel.textColor = UIColor.blue
        fourthButtonLabel.attributedText = NSAttributedString(string: "@erhan.aktas06", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        fourthButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        fourthButtonLabel.leadingAnchor.constraint(equalTo: fourthButton.leadingAnchor, constant: 106).isActive = true
        fourthButtonLabel.topAnchor.constraint(equalTo: fourthButton.topAnchor, constant: 16).isActive = true
        
        // fifth button
        fifthButton.addSubview(fifthButtonLabel)
        fifthButtonLabel.textColor = UIColor.blue
        fifthButtonLabel.attributedText = NSAttributedString(string: "@kuranmesaji", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        fifthButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        fifthButtonLabel.leadingAnchor.constraint(equalTo: fifthButton.leadingAnchor, constant: 106).isActive = true
        fifthButtonLabel.topAnchor.constraint(equalTo: fifthButton.topAnchor, constant: 16).isActive = true
        
        // sixth button
        sixthButton.addSubview(sixthButtonLabel)
        sixthButtonLabel.textColor = UIColor.blue
        sixthButtonLabel.attributedText = NSAttributedString(string: "erhanaktas@hotmail.com", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        sixthButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        sixthButtonLabel.leadingAnchor.constraint(equalTo: sixthButton.leadingAnchor, constant: 106).isActive = true
        sixthButtonLabel.topAnchor.constraint(equalTo: sixthButton.topAnchor, constant: 16).isActive = true
        
        // seventh button
        seventhButton.addSubview(seventhButtonLabel)
        seventhButtonLabel.textColor = UIColor.blue
        seventhButtonLabel.attributedText = NSAttributedString(string: "birrkbo@gmail.com", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        seventhButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        seventhButtonLabel.leadingAnchor.constraint(equalTo: seventhButton.leadingAnchor, constant: 106).isActive = true
        seventhButtonLabel.topAnchor.constraint(equalTo: seventhButton.topAnchor, constant: 16).isActive = true
        
        
        // eighth button
        eighthButton.addSubview(eighthButtonLabel)
        eighthButtonLabel.textColor = UIColor.blue
        eighthButtonLabel.attributedText = NSAttributedString(string: "+90 552 288 3306", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        eighthButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        eighthButtonLabel.leadingAnchor.constraint(equalTo: eighthButton.leadingAnchor, constant: 106).isActive = true
        eighthButtonLabel.topAnchor.constraint(equalTo: eighthButton.topAnchor, constant: 16).isActive = true
        
        
        
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
