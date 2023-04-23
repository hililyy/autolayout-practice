//
//  ViewController.swift
//  CustomSwitch
//
//  Created by 강조은 on 2023/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchBG: UIView!
    @IBOutlet weak var btnCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchBtn.layer.cornerRadius = switchBtn.bounds.width / 2
        switchBG.layer.cornerRadius = switchBG.bounds.height / 2
    }

    @IBAction func touchBtn(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            if self.btnCenterX.constant == 75 {
                self.btnCenterX.constant = -75
                self.view.backgroundColor = .lightGray
            } else {
                self.btnCenterX.constant = 75
                self.view.backgroundColor = .white
            }
            self.view.layoutIfNeeded()
        }
    }
}
