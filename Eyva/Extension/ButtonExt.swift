//
//  ButtonExt.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import Foundation
import UIKit


extension UIButton {
    func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
       // gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.67, b: 1, c: -1, d: -0.67, tx: 1.35, ty: 0.34))
       // gradientLayer.bounds = bounds.insetBy(dx: -0.5*bounds.size.width, dy: -0.5*bounds.size.height)
        gradientLayer.position = center
        gradientLayer.cornerRadius = self.frame.size.height / 2
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}



