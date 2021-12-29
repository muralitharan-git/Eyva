//
//  StoryBoardExt.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import Foundation
import UIKit

protocol Storyboardable {
    
    static var storyboardName: String { get }
    static var storyboardBundle: String { get }
    
    static var storyboardIdentifier: String { get }
    
    static func instantiate() -> Self
    
}

extension Storyboardable where Self: UIViewController {
    static var storyboardBundle: Bundle {
        return .main
    }
    
    static var storyboardName: String {
        return "OnBoarding"
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }
        return viewController
    }
}
