//
//  ViewController.swift
//  FloatingButton
//
//  Created by 강조은 on 2023/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            let floatingVC = segue.destination as! FloatingButtonListViewController
            floatingVC.modalPresentationStyle = .overCurrentContext  // 뒤에 있는 뷰를 보이게 함
        }
    }
}

