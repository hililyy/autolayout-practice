//
//  ViewController.swift
//  ExpandCell
//
//  Created by 강조은 on 2023/04/21.
//

import UIKit

class ViewController: UIViewController {

    var dataModels = [ExpandDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textArray = ["shortText", "long long long long long long long long long long long long long long long long long long ", "shortText", "long long long long long long long long long long long long long long ", "shortText", "long long long long long long long long long long long long long long long long long long  "]
        
        for (_, value) in textArray.enumerated() {
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
    }
}

struct ExpandDataModel {
    var description: String
    var isExpand: Bool
}

/*
 
 테이블 뷰 셀이 튀는 현상 해결 방법
 
 1. heightForRouAt 에서 정확한 높이를 지정해 확실히 해결
 
 2. tableView.reloadData()
 
 3. tableView.estimatedSectionHeaderHeight = 0
    tableView.estimatedSectionFooterHeight = 0
 
 4. 애니메이션 효과 없애기
    UIView.setAnimationsEnabled(false)
    tableView.reloadRows(at: [indexPath], with: .none)
    UIView.setAnimationsEnabled(true)
 */
