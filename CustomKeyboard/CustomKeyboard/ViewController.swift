//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by 강조은 on 2023/04/21.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let myKeyboardView = myKeyboard?.first as! CustomKeyboard
        myKeyboardView.delegate = self
        firstTextField.inputView = myKeyboardView  // 시스템 키보드 대신 내가 원하는 뷰를 출력
    }
    
    func keyboardTapped(str: String) {
        print(str)
        
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        
        if str == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        
        if str == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            let formatted = numberFormatter.string(from: NSNumber(value: hasNumber))
            
            firstTextField.text = String(describing: formatted)
        }
    }
}


/**
 보안 프로그램에서 사용하는 키보드에서 사용하는 개념
 스택뷰를 이용해 랜덤 버튼을 커스텀하기 쉬움
 커스텀뷰의 높이, 크기에 관계없이 기존 키보드 크기에 맞추어 나타남
 */
