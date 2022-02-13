//
//  LoginViewController.swift
//  FinalOne
//
//  Created by Alexander Tepper on 03/01/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            view.addGestureRecognizer(tap)

    }
    
  
    @IBAction func pressedLoginButton(_ sender: Any) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text
        else {return}
            
        if username == "alexander",
           password == "123" {
            performSegue(withIdentifier: "loginToMainSegue", sender: nil)
            print("you logged in")
            
        } else {
            print("username or password aren't correct")
        }
    }

    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
