//
//  HomeViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var subHeaderLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actionButton: UIButton!
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundOverlay-Image-test"))
        
        
        
        
        let colors = [
            UIColor(red: 0.718, green: 0.361, blue: 1, alpha: 1).cgColor,
            UIColor(red: 0.404, green: 0.102, blue: 0.894, alpha: 1).cgColor
        ]
        
        actionButton.applyGradient(colors: colors)
        
        tableView.rowHeight = UITableView.automaticDimension
        fillSubHeaderLabel()
    }
    
    private func fillSubHeaderLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.33
        let font = UIFont(name: "Mulish-Regular", size: 12)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font as Any,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle,
            .kern: 1
        ]
       let mutableAttributedString = NSMutableAttributedString(string: "The flowers of Anthea are slowly withering to reflect your inner body. Help them bloom again.",
                                                               attributes: attributes)
        subHeaderLabel.attributedText = mutableAttributedString
    }
    
    @IBAction func bluetoothButton_Tapped(_ sender: Any) {
        presentBluetoothdViewController()
    }
    
    internal func presentBluetoothdViewController() {
        let storyboard = UIStoryboard(name: "Bluetooth", bundle: Bundle.main)
        let connectViewController = storyboard.instantiateInitialViewController() as! UINavigationController
        connectViewController.modalPresentationStyle = .fullScreen
        present(connectViewController, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let rect = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 100)
        let footerView = UIView(frame:rect)
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewDescriptionCell") as! HomeTableViewDescriptionCell
            cell.fillData()
            return cell
        } else if indexPath.row == 1 {
            if homeViewModel.recordedState == .none {
                let cell = tableView.dequeueReusableCell(withIdentifier: "GenericVitalInfoTableViewCell") as! GenericVitalInfoTableViewCell
                cell.vitalRecordedState = homeViewModel.recordedState
                cell.delegate = self
                return cell
            } else if homeViewModel.recordedState == .one {
                let cell = tableView.dequeueReusableCell(withIdentifier: "VitalDataTableViewCell") as! VitalDataTableViewCell
                cell.delegate = self
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RecordedTableViewCell") as! RecordedTableViewCell
                cell.delegate = self 
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenericVitalInfoTableViewCell") as! GenericVitalInfoTableViewCell
            cell.vitalRecordedState = homeViewModel.recordedState
            cell.delegate = self
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
}

extension HomeViewController: GenericVitalInfoTableViewCellDelegate, VitalDataTableViewCellDelegate {
    func viewAllButtonTapped() {
        
    }
    
    func navigateToSelectedVitalInfo(_ type: Vitals) {
        navigateToDetailViewController(type)
    }
}

extension HomeViewController: RecordedTableViewCellDelegate {
    func navigateToRecordedVitalDetails(_ date: String) {
        navigateToRecoredVitalsViewController()
    }
}
