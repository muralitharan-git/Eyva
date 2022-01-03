//
//  SwipeUpViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import UIKit
import Gifu

class SwipeUpViewController: UIViewController {
   
    @IBOutlet weak var animatedImage: GIFImageView!
    @IBOutlet weak var swipeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeButton.setTitle("Enter to Anthea Realm", for: .normal)
        animatedImage.prepareForAnimation(withGIFNamed: "animate-launch")
        animatedImage.startAnimatingGIF()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeButton.titleLabel?.font = UIFont(name: "Mulish-Regular", size: 18)
        swipeButton.setTitleColor(rgb(244, 238, 254, 1.0), for: .normal)
    }
}
