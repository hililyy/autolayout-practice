//
//  ViewController.swift
//  Popup
//
//  Created by 강조은 on 2023/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showPopup(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Popup", bundle: nil)
        
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "PopupVC")
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false)
    }
}
