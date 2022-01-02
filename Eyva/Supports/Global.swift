//
//  Global.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 27/12/21.
//

import Foundation
import UIKit

let screenWidth              =   UIScreen.main.bounds.width
typealias OnSuccess = () -> Void
typealias OnError   = (Error) -> Void

func rgb(_ r: Int, _ g: Int, _ b: Int, _ a: CGFloat) -> UIColor {
    return UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
}

// Gradient
let pinkGradientBG = [
    UIColor(red: 0.718, green: 0.478, blue: 0.733, alpha: 1).cgColor,
    UIColor(red: 0.937, green: 0.678, blue: 0.788, alpha: 1).cgColor
]

let blueGradientBG = [
    UIColor(red: 0.337, green: 0.388, blue: 0.549, alpha: 1).cgColor,
    UIColor(red: 0.443, green: 0.71, blue: 0.827, alpha: 1).cgColor
]

let brownGradientBG = [
    UIColor(red: 0.475, green: 0.239, blue: 0.38, alpha: 1).cgColor,
    UIColor(red: 0.78, green: 0.447, blue: 0.447, alpha: 1).cgColor
]

internal func getMutableAttributedString(text: String,
                                  font: UIFont,
                                  textColor: UIColor,
                                  lineHeight: CGFloat,
                                 _ textAlignment: NSTextAlignment = .left) -> NSMutableAttributedString {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineHeightMultiple = lineHeight
    paragraphStyle.alignment = textAlignment
    let attributes: [NSAttributedString.Key: Any] = [
        .font: font as Any,
        .foregroundColor: textColor,
        .paragraphStyle: paragraphStyle,
        .kern: 1
    ]
    let mutableAttributedString = NSMutableAttributedString(string: text,
                                                            attributes: attributes)
    return mutableAttributedString
}
