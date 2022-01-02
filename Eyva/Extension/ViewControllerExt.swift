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
    
    internal func navigateToRecoredVitalsViewController() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
        let recordedViewController = storyboard.instantiateViewController(withIdentifier: "VitalsRecoredValueViewController") as! VitalsRecoredValueViewController
        navigationController?.pushViewController(recordedViewController, animated: true)
    }
    
    internal func navigateToViewAllVitalsViewController() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
        let viewAllVitalsViewController = storyboard.instantiateViewController(withIdentifier: "ViewAllVitalsViewController") as! ViewAllVitalsViewController
        navigationController?.pushViewController(viewAllVitalsViewController, animated: true)
    }
    
    internal func navigateToHomeViewController() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    internal func navigateToViewAllRecordedViewController(vitalInfo: VitalInfo, dataSource: VitalsDataSource) {
        let insightsStoryBoard = UIStoryboard(name: "Insights", bundle: nil)
        let insightsViewController = insightsStoryBoard.instantiateViewController(identifier: "ViewAllRecordedDataViewController", creator: { coder in
            return ViewAllRecordedDataViewController(coder: coder, vitalInfo: vitalInfo, dataSource: dataSource)
        })
        navigationController?.pushViewController(insightsViewController,
                                                 animated: true)
    }
    
    internal func navigateToDataDetailedViewController(range: ResultRange, type: Vitals, viewModel: InsightsViewModel) {
        let insightsStoryBoard = UIStoryboard(name: "Insights", bundle: nil)
        let detailViewController = insightsStoryBoard.instantiateViewController(identifier: "VitalDataDetailedViewController", creator: { coder in
            return VitalDataDetailedViewController(coder: coder, range: range, type: type, viewModel: viewModel)
        })
        navigationController?.pushViewController(detailViewController,
                                                 animated: true)
    }
}
