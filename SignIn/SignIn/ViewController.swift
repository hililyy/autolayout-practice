//
//  ViewController.swift
//  SignIn
//
//  Created by 강조은 on 2023/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)  // UITextfield의 값이 변경될 때 호출
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        if textField == emailTextField {
            print("email text field \(String(describing: textField.text))")
            
            if isVaildEmail(email: textField.text) {
                emailError.heightAnchor.constraint(equalToConstant: 0).isActive = true
            } else {
                
            }
        } else if textField == passwordTextField {
            print("password text field \(String(describing: textField.text))")
        }
    }
    
    func isVaildEmail(email: String?) -> Bool {
        guard let email = email else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
}
