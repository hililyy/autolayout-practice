//
//  ViewController.swift
//  Calculator
//
//  Created by 강조은 on 2023/04/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.layer.cornerRadius = 20
        resultLabel.layer.masksToBounds = true  // UIView에 설정해주기
//        resultLabel.clipsToBounds = true  // masksToBounds와 비슷함 (선택해서 사용하면 됨)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for btn in [btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btn10, btn11] {
            btn!.layer.cornerRadius = btn!.bounds.height / 2
        }
    }
}
