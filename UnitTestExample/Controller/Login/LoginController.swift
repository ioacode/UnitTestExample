//
//  LoginController.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 15/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonRegister: UIButton!
    
    let foodReviewApiClient = FoodReviewApiClient() 
    let expectedEmail = "hahaha@gmail.com"
    let expectedPassword = "123456"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hiddenNavigation()
    }
    
    @IBAction func pressLogin(_ sender: Any) {
        loginService()
    }
    
    @IBAction func pressRegister(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let register = story.instantiateViewController(identifier: Indetifier.register.rawValue)
        self.navigationController?.pushViewController(register, animated: true)
    }
    
    func loginService() {
        guard let email = fieldEmail.text, !email.isEmpty,
              let password = fieldPassword.text, !password.isEmpty  else {
            popupAlert(title: "Missing Credentials", message: "Missing email or password")
            return
        }
        
        guard expectedEmail == email else {
            popupAlert(title: "Invalid Credentials", message: "Invalid email")
            return
        }
        
        guard expectedPassword == password else {
            popupAlert(title: "Invalid Credentials", message: "Invalid Password")
            return
        }
        
        UserDefaults.standard.set(true, forKey: "loggedIn")
        
        
        
        
        foodReviewApiClient.login(fieldEmail.text!, password: fieldPassword.text!) { dictionary, error in
            guard let json = dictionary else {
                return
            }
            do {
                let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
                let userprofile = try JSONDecoder().decode(UserProfile.self, from: jsonData)
                self.presentProfile()
            } catch {
                print("error")
            }
        }
    }
    
    func presentProfile() {
        DispatchQueue.main.async {
            let profile = self.storyboard!.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController
            self.navigationController!.pushViewController(profile, animated: true)
        }
        
    }

}
