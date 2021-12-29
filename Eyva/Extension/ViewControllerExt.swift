//
//  ViewControllerExt.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    internal func navigateToDashboardViewController() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
        let dashboardViewController = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        navigationController?.pushViewController(dashboardViewController, animated: true)
    }
        
    internal func navigateToDetailViewController(_ selectedVital: Vitals) {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.vitalType = selectedVital
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
