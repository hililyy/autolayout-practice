//
//  PopupVC.swift
//  Popup
//
//  Created by 강조은 on 2023/04/23.
//

import UIKit

class PopupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePopup(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}
