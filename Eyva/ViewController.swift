//
//  ViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 25/12/21.
//

import UIKit



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaultsHelper.getUserDetailsSavedState() {
            navigateToHomeViewController()
        } else {
            navigateToOnBoardingViewController()
        }
    }
    
    private func navigateToOnBoardingViewController() {
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: Bundle.main)
        let swipeUpViewController = storyboard.instantiateViewController(withIdentifier: "SwipeUpViewController") as! SwipeUpViewController
        navigationController?.pushViewController(swipeUpViewController, animated: false)
    }
}



