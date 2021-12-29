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
}
