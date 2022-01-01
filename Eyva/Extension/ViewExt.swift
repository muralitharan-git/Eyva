//
//  ViewExt.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 27/12/21.
//

import Foundation
import UIKit

extension UIView {
    func enableTapToDismissKeyboard() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:)))
        gestureRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(gestureRecognizer)
    }
    
    func shake(count : Float = 6,for duration : TimeInterval = 0.5, withTranslation translation : Float = 5) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
