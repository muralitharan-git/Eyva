//
//  OnBoardingSceneViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import UIKit

class OnBoardingSceneViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    internal var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = setDescriptionLabel()
    }
    
    private func setDescriptionLabel() -> String {
        switch currentIndex {
        case 0:
            return "In a far world 100 light years ahead there's a virtual world created by the ONE."
        case 1:
            return "The physical, material possessions become invalid there but the nature of the world reponds to the 6 unique elements."
        case 2:
            return "It's time to take a step in this new age, this new dimension, and this new reality and connect with your true form of wealth!"
        default:
            return ""
        }
    }
}
