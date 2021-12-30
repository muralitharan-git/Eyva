//
//  HomeViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actionButton: UIButton!
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = sharedCoreDataManager.fetchUserName()
        tableView.rowHeight = UITableView.automaticDimension
    
        fillSubHeaderLabel()
       
        actionButton.setTitle("I want to connect to Eyva", for: .normal)
        actionButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 17)
        actionButton.setTitleColor(.white, for: .normal)
        //fillGradientForActionButton()
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
    
    private func fillGradientForActionButton() {
        actionButton.backgroundColor = nil
        actionButton.layoutIfNeeded()
        
        let layer0 = CAGradientLayer()

        layer0.colors = [
          UIColor(red: 0.718, green: 0.361, blue: 1, alpha: 1).cgColor,
          UIColor(red: 0.404, green: 0.102, blue: 0.894, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.67, b: 1, c: -1, d: -0.67, tx: 1.35, ty: 0.34))

        layer0.bounds = actionButton.bounds.insetBy(dx: -0.5*actionButton.bounds.size.width, dy: -0.5*actionButton.bounds.size.height)

        layer0.position = actionButton.center
       // actionButton.layer.insertSublayer(layer0, at: 0)
        actionButton.layer.addSublayer(layer0)
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
        navigateToViewAllVitalsViewController()
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
