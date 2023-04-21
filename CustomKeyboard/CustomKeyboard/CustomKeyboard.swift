//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by 강조은 on 2023/04/21.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(str: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.keyboardTapped(str: sender.titleLabel!.text!)
    }
}
