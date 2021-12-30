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
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
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
    
    private func navigateToHomeViewController() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}



