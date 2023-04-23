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
    
    var emailErrorHeight: NSLayoutConstraint!
    var pwErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)  // UITextfield의 값이 변경될 때 호출
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        pwErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            
            switch textField {
            case self.emailTextField:
                self.emailErrorHeight.isActive = self.isVaildEmail(email: textField.text)
            case self.passwordTextField:
                self.pwErrorHeight.isActive = self.isVaildPW(pw: textField.text!)
            default:
                break
            }
            
            self.view.layoutIfNeeded()
        }
    }
    
    func isVaildEmail(email: String?) -> Bool {
        guard let email = email else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        
        return pred.evaluate(with: email)
    }
    
    func isVaildPW(pw: String?) -> Bool {
        guard let pw = pw else { return false }
        
        return !(pw.count < 8)
    }
}
