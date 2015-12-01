//
//  TriangleView.swift
//  Project 3
//
//  Created by Bernard JIANG on 14/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class TriangleView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        // Get Height and Width
        let layerHeight = self.layer.frame.height
        let layerWidth = self.layer.frame.width
        
        // Create Path
        let bezierPath = UIBezierPath()
        
        // Draw Points
        bezierPath.moveToPoint(CGPointMake(0, layerHeight))
        bezierPath.addLineToPoint(CGPointMake(layerWidth, layerHeight))
        bezierPath.addLineToPoint(CGPointMake(layerWidth/2, 0))
        bezierPath.addLineToPoint(CGPointMake(0, layerHeight))
        bezierPath.closePath()
        
        // Mask to Path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.CGPath
        self.layer.mask = shapeLayer
        
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
