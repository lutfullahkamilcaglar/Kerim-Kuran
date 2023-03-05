//
//  AboutViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 25/02/2023.
//

import UIKit

class AboutViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Birr platform"
        configureUI()
    }
    
    // Step 1: Create Scroll View
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Step 2: Create Content View
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Step 3: Create UI
    let topView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()

    let middleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let writerImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "birplatformpng")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
   
    
    let ceviriOykusuBottomLabel: UILabel = {
       
        let attributedString = NSMutableAttributedString()
        // bir platform
        
        let birPlatform = K.birPlatform
        let birPlatformAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let birPlatformString = NSAttributedString(string: "\n\(birPlatform)\n", attributes: birPlatformAttributes)

        let birPlatformText1 = K.birPlatformText1
        let birPlatformText1Attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let birPlatformText1String1 = NSAttributedString(string: "\n\(birPlatformText1)", attributes: birPlatformText1Attributes)
        
        attributedString.append(birPlatformString)
        attributedString.append(birPlatformText1String1)
        
        // platform amaci
        let platformAmaci = K.platformAmaci
        let platformAmaciAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let platformAmaciString = NSAttributedString(string: "\n\n\(platformAmaci)", attributes: platformAmaciAttributes)

        let platformAmaciText1 = K.platformAmaciText1
        let platformAmaciText1Attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let platformAmaciString1 = NSAttributedString(string: "\n\(platformAmaciText1)", attributes:platformAmaciText1Attributes)

        attributedString.append(platformAmaciString)
        attributedString.append(platformAmaciString1)
      
        // temelIlkelerimiz
        let temelIlkelerimiz = K.temelIlkelerimiz
        let temelIlkelerimizAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let temelIlkelerimizString = NSAttributedString(string: "\n\n\(temelIlkelerimiz)", attributes: temelIlkelerimizAttributes)

        let temelIlkelerimizText1 = K.temelIlkelerimizText1
        let temelIlkelerimizText1Attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let temelIlkelerimizString1 = NSAttributedString(string: "\(temelIlkelerimizText1)", attributes:temelIlkelerimizText1Attributes)

        attributedString.append(temelIlkelerimizString)
        attributedString.append(temelIlkelerimizString1)
      
        
        let prefaceLabel = UILabel()
        prefaceLabel.translatesAutoresizingMaskIntoConstraints = false
        prefaceLabel.attributedText = attributedString
        prefaceLabel.lineBreakMode = .byWordWrapping
        prefaceLabel.numberOfLines = 0
    
        return prefaceLabel
    }()
    
    
    //Step 4: Add Constraints
    func configureUI() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        configureTopView()
        configureMiddleView()
    }
    
    func configureTopView() {
        contentView.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            topView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            topView.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
    
    }
    
    func configureMiddleView() {
        contentView.addSubview(middleView)
        NSLayoutConstraint.activate([
        middleView.topAnchor.constraint(equalTo:topView.bottomAnchor),
        middleView.leftAnchor.constraint (equalTo: contentView.leftAnchor, constant: 16),
        middleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        middleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        middleView.addSubview (writerImage)
        NSLayoutConstraint.activate([
            writerImage.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 10),
            writerImage.leftAnchor.constraint(equalTo: middleView.leftAnchor),
            writerImage.rightAnchor.constraint(equalTo:middleView.rightAnchor),
            writerImage.heightAnchor.constraint(equalToConstant:200)
        ])
        
        middleView.addSubview(ceviriOykusuBottomLabel)
        NSLayoutConstraint.activate([
            ceviriOykusuBottomLabel.topAnchor.constraint (equalTo: writerImage .bottomAnchor, constant: 0),
            ceviriOykusuBottomLabel.leftAnchor.constraint(equalTo:middleView.leftAnchor),
            ceviriOykusuBottomLabel.rightAnchor.constraint(equalTo:middleView.rightAnchor),
            ceviriOykusuBottomLabel.bottomAnchor.constraint(equalTo: middleView.bottomAnchor)
        ])
    }

}
