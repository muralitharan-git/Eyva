//
//  ViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 25/12/21.
//

import UIKit

let Is_Show_OnBoarding_Screens = false

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Is_Show_OnBoarding_Screens {
            navigateToOnBoardingViewController()
        } else {
            navigateToDashboardViewController()
        }
    }
    
    private func navigateToOnBoardingViewController() {
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: Bundle.main)
        let swipeUpViewController = storyboard.instantiateViewController(withIdentifier: "SwipeUpViewController") as! SwipeUpViewController
        navigationController?.pushViewController(swipeUpViewController, animated: false)
    }
}



