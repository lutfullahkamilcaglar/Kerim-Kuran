//
//  PrefaceViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 25/02/2023.
//

import UIKit

class PrefaceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Önsöz"
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
        image.image = UIImage(named: "prefaceSvg")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
   
    
    let ceviriOykusuBottomLabel: UILabel = {
       
        let attributedString = NSMutableAttributedString()
        // ceviri oykusu
        
        let ceviriOykusu = K.cevirininOykusu
        let ceviriOykusuAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let ceviriOykusuString = NSAttributedString(string: "\(ceviriOykusu)\n", attributes: ceviriOykusuAttributes)

        let cevirininOykusuText1 = K.cevirininOykusuText1

        let cevirinOykusuAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let cevirininOykusuString1 = NSAttributedString(string: "\n\(cevirininOykusuText1)", attributes: cevirinOykusuAttributes)
        
        attributedString.append(ceviriOykusuString)
        attributedString.append(cevirininOykusuString1)
        
        // ceviri hakkinda
        let ceviriHakkinda = K.ceviriHakkinda
        let ceviriHakkindaAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let ceviriHakkindaString = NSAttributedString(string: "\n\n\(ceviriHakkinda)", attributes: ceviriHakkindaAttributes)

        let ceviriHakkindaText1 = K.ceviriHakkindaText1
        let cevirinHakkindaAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let ceviriHakkindaString1 = NSAttributedString(string: "\n\n\(ceviriHakkindaText1)", attributes:cevirinHakkindaAttributes)

        attributedString.append(ceviriHakkindaString)
        attributedString.append(ceviriHakkindaString1)
      
        // cevirilerdeki farklar
        
        let cevirilerdekiFark = K.cevirilerdekiFark
        let cevirilerdekiFarkAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let cevirilerdekiFarkString = NSAttributedString(string: "\n\n\(cevirilerdekiFark)", attributes: cevirilerdekiFarkAttributes)

        let cevirilerdekiFark1 = K.cevirilerdekiFarkText1
        let cevirilerdekiAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let cevirilerdekiFarkString1 = NSAttributedString(string: "\n\n\(cevirilerdekiFark1)", attributes:cevirilerdekiAttributes)

        attributedString.append(cevirilerdekiFarkString)
        attributedString.append(cevirilerdekiFarkString1)
        
        // Geleneksel Anlayış
        
        let gelenekselAnlayis = K.gelenekselAnlayis
        let gelenekselAnlayisAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let gelenekselAnlayisString = NSAttributedString(string: "\n\n\(gelenekselAnlayis)", attributes: gelenekselAnlayisAttributes)
        
        let gelenekselAnlayis1 = K.gelenekselAnlayisText1
        let gelenekselAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let gelenekselAnlayisFarkString1 = NSAttributedString(string: "\n\n\(gelenekselAnlayis1)", attributes:gelenekselAttributes)

        attributedString.append(gelenekselAnlayisString)
        attributedString.append(gelenekselAnlayisFarkString1)
        
        // modernist anlayis
        
        let modernistAnlayis = K.modernistAnlayis
        let modernistAnlayisAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let modernistAnlayisString = NSAttributedString(string: "\n\n\(modernistAnlayis)", attributes: modernistAnlayisAttributes)
        
        let modernistAnlayis1 = K.modernistAnlayisText1
        let modernistAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let modernistAnlayisString1 = NSAttributedString(string: "\n\n\(modernistAnlayis1)", attributes:modernistAttributes)

        attributedString.append(modernistAnlayisString)
        attributedString.append(modernistAnlayisString1)
        
        // tarihselci anlayis
        
        
        let tarihselciAnlayis = K.tarihselciAnlayıs
        let tarihselciAnlayisAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let tarihselciAnlayisString = NSAttributedString(string: "\n\n\(tarihselciAnlayis)", attributes: tarihselciAnlayisAttributes)
        
        let tarihselciAnlayis1 = K.tarihselciAnlayısText1
        let tarihselAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let tarihselciAnlayisString1 = NSAttributedString(string: "\n\n\(tarihselciAnlayis1)", attributes:tarihselAttributes)

        attributedString.append(tarihselciAnlayisString)
        attributedString.append(tarihselciAnlayisString1)
        
        
         // mistikAnlayıs ,
        
        let mistikAnlayıs = K.mistikAnlayıs
        let mistikAnlayısAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let mistikAnlayısString = NSAttributedString(string: "\n\n\(mistikAnlayıs)", attributes: mistikAnlayısAttributes)
        
        let mistikAnlayıs1 = K.mistikAnlayısText1
        let mistikAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let mistikAnlayisString1 = NSAttributedString(string: "\n\n\(mistikAnlayıs1)", attributes:mistikAttributes)

        attributedString.append(mistikAnlayısString)
        attributedString.append(mistikAnlayisString1)
        
        
        
        //bilgiKaynak
        
        let bilgiKaynak = K.bilgiKaynak
        let bilgiKaynakAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let bilgiKaynakString = NSAttributedString(string: "\n\n\(bilgiKaynak)", attributes: bilgiKaynakAttributes)
        
        let bilgiKaynak1 = K.bilgiKaynakText1
        let bilgiAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let bilgiKaynakString1 = NSAttributedString(string: "\n\n\(bilgiKaynak1)", attributes:bilgiAttributes)

        attributedString.append(bilgiKaynakString)
        attributedString.append(bilgiKaynakString1)
        
        
        
        // kuranYeterli
        
        let kuranYeterli = K.kuranYeterli
        let kuranYeterliAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let kuranYeterliString = NSAttributedString(string: "\n\n\(kuranYeterli)", attributes: kuranYeterliAttributes)
        
        let kuranYeterli1 = K.kuranYeterliText1
        let kuranYAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let kuranYeterliString1 = NSAttributedString(string: "\n\n\(kuranYeterli1)", attributes:kuranYAttributes)

        attributedString.append(kuranYeterliString)
        attributedString.append(kuranYeterliString1)
        
        
        // kuranDonus
        
        let kuranDonus = K.kuranDonus
        let kuranDonusAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let kuranDonusString = NSAttributedString(string: "\n\n\(kuranDonus)", attributes: kuranDonusAttributes)
        
        let kuranDonus1 = K.kuranDonusText1
        let kuranDAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let kuranDonusString1 = NSAttributedString(string: "\n\n\(kuranDonus1)", attributes:kuranDAttributes)

        attributedString.append(kuranDonusString)
        attributedString.append(kuranDonusString1)
        
        
        
        // preface
        let preface = K.preface
        let prefaceAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        let prefaceString = NSAttributedString(string: "\n\n\(preface)", attributes: prefaceAttributes)
        
        let preface1 = K.prefaceText1
        let preAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let prefaceString1 = NSAttributedString(string: "\n\n\(preface1)", attributes:preAttributes)

        attributedString.append(prefaceString)
        attributedString.append(prefaceString1)
        
         
        
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
            writerImage.heightAnchor.constraint(equalToConstant:300)
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
