//
//  PrefaceViewController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 25/02/2023.
//

import UIKit

class PrefaceViewController: UIViewController {

    var data: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a typeLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a typeLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a typeLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type"
        var image: UIImage = UIImage(named: "prefaceSvg")!

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Add the scroll view
            let scrollView = UIScrollView(frame: view.bounds)
            scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 3)
            view.addSubview(scrollView)

            
            // Add the image view
            let imageView = UIImageView(image: image)
            scrollView.addSubview(imageView)
            
            // Add the first text label
            let label1 = UILabel()
            label1.text = data
            label1.numberOfLines = 0
            scrollView.addSubview(label1)
            
            // Add the second text label
            let label2 = UILabel()
            label2.text = data
            label2.numberOfLines = 0
            scrollView.addSubview(label2)
            
            // Add constraints for the views
            imageView.translatesAutoresizingMaskIntoConstraints = false
            label1.translatesAutoresizingMaskIntoConstraints = false
            label2.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                    imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
                    imageView.widthAnchor.constraint(equalToConstant: view.frame.width),
                    imageView.heightAnchor.constraint(equalToConstant: view.frame.width * CGFloat(image.size.height) / CGFloat(image.size.width)),
                    
                    label1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
                    label1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                    label1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
                    
                    label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
                    label2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                    label2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
                    label2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
                ])
        }

   

}
