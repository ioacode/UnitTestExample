//
//  ControllerExtension.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 15/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func hiddenNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hiddenLineNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func showLineNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.layoutIfNeeded()
        
    }
    
    func popupAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
    }
    
}
