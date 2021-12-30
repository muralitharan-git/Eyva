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
//        self.backgroundColor = nil
//        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0, 1]
        
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.67, b: 1, c: -1, d: -0.67, tx: 1.35, ty: 0.34))
        
        gradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
        
        gradientLayer.position = self.center
        //self.layer.addSublayer(gradientLayer)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
//        gradientLayer.frame = self.bounds
//        gradientLayer.cornerRadius = self.frame.height/2
//
//        gradientLayer.shadowColor = UIColor.darkGray.cgColor
//        gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
//        gradientLayer.shadowRadius = 5.0
//        gradientLayer.shadowOpacity = 0.3
//        gradientLayer.masksToBounds = false
//
//        self.layer.insertSublayer(gradientLayer, at: 0)
//        self.contentVerticalAlignment = .center
//        self.setTitleColor(UIColor.white, for: .normal)
//        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
//        self.titleLabel?.textColor = UIColor.white
    }
}

//    let layer0 = CAGradientLayer()
//
//    layer0.colors = [
//
//      UIColor(red: 0.718, green: 0.361, blue: 1, alpha: 1).cgColor,
//
//      UIColor(red: 0.404, green: 0.102, blue: 0.894, alpha: 1).cgColor
//
//    ]
//
//    layer0.locations = [0, 1]
//
//    layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
//
//    layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
//
//    layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.67, b: 1, c: -1, d: -0.67, tx: 1.35, ty: 0.34))
//
//    layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
//
//    layer0.position = view.center
//
//    view.layer.addSublayer(layer0)
