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
    
    let fromFirstPageToSecondSegue = "fromFirstPageToSecondSegue"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func switchFillLogun(_ sender: Any) {
        loginTextField.text = "admin"
        passwordTextField.text = "123456"
    }
   
    
    @IBAction func pressSignButton(_ sender: UIButton) {
        if self.loginTextField.text == "admin",
           self.passwordTextField.text == "123456" {
            performSegue(withIdentifier: fromFirstPageToSecondSegue, sender: self)
        } else {
            let alert = UIAlertController(title: "Error", message: "Entered wrong login or password", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func signOut(_ seg: UIStoryboardSegue){
        self.loginTextField.text = ""
        self.passwordTextField.text = ""
    
    }
    
    
}

