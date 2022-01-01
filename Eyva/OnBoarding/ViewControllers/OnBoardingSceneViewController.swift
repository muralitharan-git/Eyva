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
        
        descriptionLabel.attributedText = getAttributedMutableString()
    }
    
    private func getDescriptionText() -> String {
        switch currentIndex {
        case 0:
            return "The flowers of Anthea bloom in a blissful reverie undisturbed from all of humanity."
        case 1:
            return "Powerful, Magical and Healing. The Anthea flowers blossom in their realm, protected by an extraordinary almighty waterfall only a few have dared to pass."
        case 2:
            return "But if you wish to join us on this journey, we promise you an ethereal nexus like no other-for the \n"
        default:
            return ""
        }
    }
    
    private func getAttributedMutableString() -> NSMutableAttributedString {
        let text = getDescriptionText()
        
        if currentIndex == 2 {
            let attributedContent = getMutableAttributedString(text: text,
                                                       font: UIFont(name: "Mulish-Regular", size: 20)!,
                                                       textColor: rgb(181, 179, 183, 1),
                                                       lineHeight: 1.59,
                                                       .center)
            let secondHalf = "Anthea Realm’s ancient magic heals you from within."
            attributedContent.append(getMutableAttributedString(text: secondHalf,
                                                         font: UIFont(name: "Mulish-Regular", size: 20)!,
                                                         textColor: rgb(50, 180, 219, 1),
                                                         lineHeight: 1.59,
                                                         .center))
           return attributedContent
            
        } else {
            return getMutableAttributedString(text: text,
                                              font: UIFont(name: "Mulish-Regular", size: 20)!,
                                              textColor: rgb(181, 179, 183, 1),
                                              lineHeight: 1.59,
                                              .center)
        }
    }
}
