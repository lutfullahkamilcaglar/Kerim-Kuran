//
//  PortraitNavigationController.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 08/03/2023.
//

import UIKit

class PortraitNavigationController: UINavigationController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }
       
       override var shouldAutorotate: Bool {
           return false
       }
}
