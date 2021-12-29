//
//  Global.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 27/12/21.
//

import Foundation
import UIKit

let screenWidth              =   UIScreen.main.bounds.width 

func rgb(_ r: Int, _ g: Int, _ b: Int, _ a: CGFloat) -> UIColor {
    return UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
}
