//
//  OnBoardingViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var psgeControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    private var onboardingPageViewController: OnboardingPageViewController?
    internal weak var delegate: OnboardingCompletionProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
        updateButtonTitleBasedOnState()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUIComponents()
    }
    
    private func setUIComponents() {
        nextButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 17)
        nextButton.setTitleColor(.white, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let onboardingViewController = segue.destination as? OnboardingPageViewController {
            onboardingPageViewController = onboardingViewController
            onboardingPageViewController?.onboardingDelegate = self
        }
    }
    
    @IBAction func nextButton_Tapped(_ sender: Any) {
        if isCurrentStateIsinLastIndex() {
            navigateToUserInputViewController()
        } else {
            onboardingPageViewController?.goToNextPage()
        }
    }
    
    private func isCurrentStateIsinLastIndex() -> Bool {
        return psgeControl.currentPage == psgeControl.numberOfPages - 1
    }
    
    private func updateButtonTitleBasedOnState() {
        let isInLastIndex = isCurrentStateIsinLastIndex()
        let bgImage = isInLastIndex ? UIImage(named: "enter-button-bg") : UIImage(named: "next-button-cta")
        nextButton.setImage(bgImage, for: .normal)
        setUIComponents()
    }
    
    private func navigateToUserInputViewController() {
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: Bundle.main)
        let userInputViewController = storyboard.instantiateViewController(withIdentifier: "UserInputViewController") as! UserInputViewController
         navigationController?.pushViewController(userInputViewController, animated: true)
    }
}

extension OnBoardingViewController {
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
         case .left:
            onboardingPageViewController?.goToNextPage()
         case .right:
            onboardingPageViewController?.goToPreviousPage()
         default:
            break
       }
    }
}

extension OnBoardingViewController: OnboardingViewControllerProtocol {
    func setUpInitialConfig(_ count: Int) {
        psgeControl.numberOfPages = count
        fillUIComponents(0)
    }
    
    func nextIndex(_ index: Int) {
        fillUIComponents(index)
    }
    
    func previousIndex(_ index: Int) {
        fillUIComponents(index)
    }
    
    private func fillUIComponents(_ index: Int) {
        psgeControl.currentPage = index
        updateButtonTitleBasedOnState()
    }
}

protocol OnboardingCompletionProtocol: AnyObject {
    func completionOfOnboarding()
}

