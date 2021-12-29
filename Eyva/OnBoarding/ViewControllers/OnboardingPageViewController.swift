//
//  OnboardingPageViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    internal weak var onboardingDelegate: OnboardingViewControllerProtocol?
    
    private lazy var orderedViewController: [OnBoardingSceneViewController] = {
        return self.createSceneViewControllers()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstVC = orderedViewController.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

    required init?(coder: NSCoder) {
           super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    private func createSceneViewControllers() -> [OnBoardingSceneViewController] {
        let firstSceneViewController = getViewController(withIdentifier: "OnBoardingSceneViewController")
        firstSceneViewController.currentIndex = 0
        
        let secondSceneViewController = getViewController(withIdentifier: "OnBoardingSceneViewController")
        secondSceneViewController.currentIndex = 1
        
        let thirdSceneViewController = getViewController(withIdentifier: "OnBoardingSceneViewController")
        thirdSceneViewController.currentIndex = 2
        
        return [firstSceneViewController, secondSceneViewController, thirdSceneViewController]
    }
    
    private func getViewController(withIdentifier identifier: String) -> OnBoardingSceneViewController {
        return  UIStoryboard(name: "OnBoarding", bundle: Bundle.main).instantiateViewController(withIdentifier: identifier) as! OnBoardingSceneViewController
    }
    
    private func findingOutIndex(_ onboardingSceneViewController: OnBoardingSceneViewController?) {
        if let onboardingSceneViewController = onboardingSceneViewController, let currentIndex = orderedViewController.firstIndex(of: onboardingSceneViewController)  {
            onboardingDelegate?.nextIndex(currentIndex)
        }
    }
    
    internal func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        findingOutIndex(nextViewController as? OnBoardingSceneViewController)
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
    }
    
    internal func goToPreviousPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
        findingOutIndex(previousViewController as? OnBoardingSceneViewController)
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController as! OnBoardingSceneViewController) else { return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return orderedViewController.last
        }
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController as! OnBoardingSceneViewController) else { return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < orderedViewController.count else {
            return orderedViewController.first
        }
        guard orderedViewController.count > nextIndex else {
            return nil
        }
        return orderedViewController[nextIndex]
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    func presentationCount(for: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let lastSceneViewController = viewControllers?.last {
            findingOutIndex(lastSceneViewController as? OnBoardingSceneViewController)
        }
    }
}



protocol OnboardingViewControllerProtocol: AnyObject {
    func setUpInitialConfig(_ count: Int)
    func nextIndex(_ index: Int)
    func previousIndex(_ index: Int)
}
