//
//  ViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var allVerseButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var prefaceButton : UIButton!
    @IBOutlet weak var aboutButton   : UIButton!
    @IBOutlet weak var contactButton : UIButton!
    
    @IBOutlet weak var buttonView: UIView!
    
    //Buttons image setups
    let verseButtonImage    = UIImageView(image: UIImage(named: "showVerseIcon"))
    let continueButtonImage = UIImageView(image: UIImage(named: "continueIcon"))
    let prefaceButtonImage  = UIImageView(image: UIImage(named: "foreIcon"))
    let aboutButtonImage    = UIImageView(image: UIImage(named: "birPlatformIcon"))
    
    //Button label setups
    let verseButtonLabel     = UILabel()
    let continueButtonLabel  = UILabel()
    let prefaceButtonLabel   = UILabel()
    let aboutButtonLabel     = UILabel()
    let contactButtonLabel   = UILabel()
    
    // create controls
    let leadingGuide = UILayoutGuide()
    let middleGuide = UILayoutGuide()
    let trailingGuide = UILayoutGuide()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Ana Sayfa", style: .plain, target: nil, action: nil)
 
        
        setupViews()
    }
    
    func buttonViewSetup() {
        
        view.addSubview(buttonView)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
 
        buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        buttonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 176).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        
    }

    func setupViews() {
        view.addLayoutGuide(leadingGuide)
        view.addLayoutGuide(middleGuide)
        view.addLayoutGuide(trailingGuide)
        let margins = view.layoutMarginsGuide
        
        buttonViewSetup()
        VerseButtonView()
        continueButtonView()
        prefaceButtonView()
        aboutButtonView()
        contactButtonView()
         
        // usttekiler
        
        //leading guide
        margins.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor).isActive = true
        leadingGuide.trailingAnchor.constraint(equalTo: allVerseButton.leadingAnchor).isActive = true
        
        //middleGuide
        allVerseButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor).isActive = true
        middleGuide.trailingAnchor.constraint(equalTo: continueButton.leadingAnchor).isActive = true
        
        //trailing guide
        continueButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        //button equal
        allVerseButton.widthAnchor.constraint(equalTo: continueButton.widthAnchor).isActive = true
        
        //space equal widths
        leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        
        
        // alltakiler
        
        //leading guide
     //   margins.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor).isActive = true
        leadingGuide.trailingAnchor.constraint(equalTo: prefaceButton.leadingAnchor).isActive = true
        
        //middleGuide
        prefaceButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor).isActive = true
        middleGuide.trailingAnchor.constraint(equalTo: aboutButton.leadingAnchor).isActive = true
        
        //trailing guide
        aboutButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        //button equal
        prefaceButton.widthAnchor.constraint(equalTo: aboutButton.widthAnchor).isActive = true
        
        //space equal widths
        leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        
        
        leadingGuide.trailingAnchor.constraint(equalTo: contactButton.leadingAnchor).isActive = true
        contactButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        
    }
    func VerseButtonView() {
        
        
        view.addSubview(allVerseButton)
        allVerseButton.layer.cornerRadius = 15
        allVerseButton.translatesAutoresizingMaskIntoConstraints = false
        allVerseButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        allVerseButton.heightAnchor.constraint(equalToConstant: 165).isActive = true
        allVerseButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0).isActive = true
       
        //button image setup
        
        allVerseButton.addSubview(verseButtonImage)
        verseButtonImage.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        verseButtonImage.translatesAutoresizingMaskIntoConstraints = false
        verseButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        verseButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        verseButtonImage.leadingAnchor.constraint(equalTo: allVerseButton.leadingAnchor, constant: 22).isActive = true
        verseButtonImage.topAnchor.constraint(equalTo: allVerseButton.topAnchor, constant: 22).isActive = true
    
        //button label setup
        allVerseButton.addSubview(verseButtonLabel)
        verseButtonLabel.frame = CGRect(x: 0, y: 0, width: 121, height: 56)
        verseButtonLabel.numberOfLines = 0
        verseButtonLabel.lineBreakMode = .byWordWrapping
        verseButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        verseButtonLabel.text = "Tüm Sureleri gör"
        verseButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        verseButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        verseButtonLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        verseButtonLabel.leadingAnchor.constraint(equalTo: allVerseButton.leadingAnchor, constant: 22).isActive = true
        verseButtonLabel.topAnchor.constraint(equalTo: allVerseButton.topAnchor, constant: 86).isActive = true
        
        //button view set
        allVerseButton.layer.cornerRadius = 12
        allVerseButton.layer.borderWidth = 1
        allVerseButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

    }
    
    func continueButtonView() {
        
        view.addSubview(continueButton)
        
        continueButton.layer.cornerRadius = 15
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 165).isActive = true
        continueButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0).isActive = true
       
        //button image setup
        
        continueButton.addSubview(continueButtonImage)
        continueButtonImage.translatesAutoresizingMaskIntoConstraints = false
        continueButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        continueButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        continueButtonImage.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor, constant: 22).isActive = true
        continueButtonImage.topAnchor.constraint(equalTo: continueButton.topAnchor, constant: 22).isActive = true
        continueButtonImage.backgroundColor = .white
    
        
        //button label setup
        continueButton.addSubview(continueButtonLabel)
        continueButtonLabel.numberOfLines = 0
        continueButtonLabel.lineBreakMode = .byWordWrapping
        continueButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        continueButtonLabel.text = "Okumaya Devam et"
        continueButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        continueButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        continueButtonLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        continueButtonLabel.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor, constant: 22).isActive = true
        continueButtonLabel.topAnchor.constraint(equalTo: continueButton.topAnchor, constant: 87).isActive = true
        
        //button view set
        continueButton.layer.cornerRadius = 12
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

        
    }
    
    func prefaceButtonView() {
        
        view.addSubview(prefaceButton)
        prefaceButton.layer.cornerRadius = 15
        prefaceButton.translatesAutoresizingMaskIntoConstraints = false
        prefaceButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        prefaceButton.heightAnchor.constraint(equalToConstant: 165).isActive = true
//        prefaceButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 0).isActive = true
        prefaceButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 185).isActive = true
        
        //button image setup
        
        
        prefaceButton.addSubview(prefaceButtonImage)
        prefaceButtonImage.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        prefaceButtonImage.translatesAutoresizingMaskIntoConstraints = false
        prefaceButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        prefaceButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        prefaceButtonImage.leadingAnchor.constraint(equalTo: prefaceButton.leadingAnchor, constant: 22).isActive = true
        prefaceButtonImage.topAnchor.constraint(equalTo: prefaceButton.topAnchor, constant: 22).isActive = true
        prefaceButtonImage.backgroundColor = .white

        
        //button label setup
        prefaceButton.addSubview(prefaceButtonLabel)
        prefaceButtonLabel.frame = CGRect(x: 0, y: 0, width: 121, height: 30)
        prefaceButtonLabel.numberOfLines = 0
        prefaceButtonLabel.lineBreakMode = .byWordWrapping
        prefaceButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        prefaceButtonLabel.text = "Önsöz"
        prefaceButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        prefaceButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        prefaceButtonLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        prefaceButtonLabel.leadingAnchor.constraint(equalTo: prefaceButton.leadingAnchor, constant: 22).isActive = true
        prefaceButtonLabel.topAnchor.constraint(equalTo: prefaceButton.topAnchor, constant: 98).isActive = true
        
        
        //button view set
        prefaceButton.layer.cornerRadius = 12
        prefaceButton.layer.borderWidth = 1
        prefaceButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

        
    }
    
    func aboutButtonView() {
        
        
        view.addSubview(aboutButton)
        aboutButton.layer.cornerRadius = 15
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        aboutButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        aboutButton.heightAnchor.constraint(equalToConstant: 165).isActive = true
//        aboutButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: 0).isActive = true
        aboutButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 185).isActive = true

        
        //button image setup
        
        aboutButton.addSubview(aboutButtonImage)
        aboutButtonImage.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        aboutButtonImage.translatesAutoresizingMaskIntoConstraints = false
        aboutButtonImage.widthAnchor.constraint(equalToConstant: 46).isActive = true
        aboutButtonImage.heightAnchor.constraint(equalToConstant: 46).isActive = true
        aboutButtonImage.leadingAnchor.constraint(equalTo: aboutButton.leadingAnchor, constant: 22).isActive = true
        aboutButtonImage.topAnchor.constraint(equalTo: aboutButton.topAnchor, constant: 22).isActive = true
        aboutButtonImage.backgroundColor = .white
        
        //button label setup
        aboutButton.addSubview(aboutButtonLabel)
        aboutButtonLabel.frame = CGRect(x: 0, y: 0, width: 121, height: 30)
        aboutButtonLabel.numberOfLines = 0
        aboutButtonLabel.lineBreakMode = .byWordWrapping
        aboutButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        aboutButtonLabel.text = "BİRR Platformu"
        aboutButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutButtonLabel.widthAnchor.constraint(equalToConstant: 121).isActive = true
        aboutButtonLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        aboutButtonLabel.leadingAnchor.constraint(equalTo: aboutButton.leadingAnchor, constant: 22).isActive = true
        aboutButtonLabel.topAnchor.constraint(equalTo: aboutButton.topAnchor, constant: 85).isActive = true
        
        
        //button view set
        aboutButton.layer.cornerRadius = 12
        aboutButton.layer.borderWidth = 1
        aboutButton.layer.borderColor = UIColor(red: 0.141, green: 0.141, blue: 0.141, alpha: 1).cgColor

    }
    
    func contactButtonView() {
        //button setup
        contactButton.layer.cornerRadius = 12
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.widthAnchor.constraint(equalToConstant: 349).isActive = true
        contactButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        contactButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 370).isActive = true
        
        //button label setup
        contactButton.addSubview(contactButtonLabel)
        contactButtonLabel.numberOfLines = 0
        contactButtonLabel.lineBreakMode = .byWordWrapping
        contactButtonLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        contactButtonLabel.text = "İletişim"
        contactButtonLabel.textColor = .white
        contactButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        contactButtonLabel.widthAnchor.constraint(equalToConstant: 73).isActive = true
        contactButtonLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        contactButtonLabel.centerXAnchor.constraint(equalTo: contactButton.centerXAnchor).isActive = true
        contactButtonLabel.centerYAnchor.constraint(equalTo: contactButton.centerYAnchor).isActive = true
    }

}






