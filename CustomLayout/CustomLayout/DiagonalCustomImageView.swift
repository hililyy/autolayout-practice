//
//  DiagonalCustomImageView.swift
//  CustomLayout
//
//  Created by 강조은 on 2023/04/23.
//

import UIKit

@IBDesignable
class DiagonalCustomImageView: UIImageView {
    
    @IBInspectable var innerHeight: CGFloat = 0
    func makePath() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint.zero) // x:0, y:0
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        makeMask()
    }
}
