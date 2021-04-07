//
//  LoginFormController.swift
//  VK
//
//  Created by Pauwell on 06.04.2021.
//

import UIKit

class LoginFormController: UIViewController {

   
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func pressSignButton(_ sender: Any) {
        if self.loginTextField.text == "admin",
           self.passwordTextField.text == "123456" {
            performSegue(withIdentifier: "pinkSegue", sender: self)
        }
    }
    
    
}
