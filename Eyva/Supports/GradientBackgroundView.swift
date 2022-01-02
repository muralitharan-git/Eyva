//
//  GradientBackgroundView.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import UIKit

class GradientBackgroundView: UIView {
    
    internal func setColors(_ colors: [CGColor]) {
        let layer0 = CAGradientLayer()
        layer0.colors = colors
        layer0.locations = [0.28, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -1.21, b: 0, c: 0, d: -5.54, tx: 1.21, ty: 2.77))
        
        
        layer0.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width, dy: -0.5 * self.bounds.size.height)
        layer0.position = self.center
        self.layer.insertSublayer(layer0, at: 0)
    }
}
