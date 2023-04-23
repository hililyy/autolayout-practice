//
//  ViewController.swift
//  Chat
//
//  Created by 강조은 on 2023/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.delegate = self
            chatTableView.dataSource = self
            chatTableView.separatorStyle = .none
        }
    }
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
    var chatDatas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사용하려는 셀 등록
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "YourCell")
        
        // 키보드 관련 옵저버 - 상태를 알려주는 것
        // 키보드 올라올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // 키보드 내려갈 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func sendString(_ sender: UIButton) {
        chatDatas.append(inputTextView.text)
        inputTextView.text = ""
        
        let lastIndexPath = IndexPath(row: chatDatas.count - 1, section: 0)
//        chatTableView.reloadData() // 전체 테이블 뷰 reload
        chatTableView.insertRows(at: [lastIndexPath], with: UITableView.RowAnimation.automatic)  // 특정 테이블 뷰만 reload
        inputTextViewHeight.constant = 40
        chatTableView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom  // 키보드 나타났을 때 키보드와 텍스트뷰가 딱 달라붙도록

        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        let notiInfo = noti.userInfo!
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row % 2 {
        case 0:
            let myCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
            myCell.myTextView.text = chatDatas[indexPath.row]
            myCell.selectionStyle = .none
            return myCell
        case 1:
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath) as! YourCell
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            yourCell.selectionStyle = .none
            return yourCell
        default:
            break
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        switch textView.contentSize.height {
        case ..<41:
            inputTextViewHeight.constant = 40
        case 100...:
            inputTextViewHeight.constant = 100
        default:
            inputTextViewHeight.constant = textView.contentSize.height
            
        }
    }
}
