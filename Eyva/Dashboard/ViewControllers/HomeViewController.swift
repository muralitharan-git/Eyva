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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        actionButton.applyGradient(colors: [rgb(183, 92, 255, 1.0).cgColor, rgb(103, 26, 228, 1.0).cgColor])
        actionButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 17)
        actionButton.setTitleColor(.white, for: .normal)
    }
    
    private func fillSubHeaderLabel() {
        subHeaderLabel.isHidden = true 
        subHeaderLabel.attributedText = getMutableAttributedString(text: "The flowers of Anthea are slowly withering to reflect your inner body. Help them bloom again.", font: UIFont(name: "Mulish-Regular", size: 12)!, textColor: .white, lineHeight: 3.82)
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
}

extension HomeViewController: GenericVitalInfoTableViewCellDelegate {
    func viewAllButtonTapped() {
        navigateToViewAllVitalsViewController()
    }
    
    func navigateToSelectedVitalInfo(_ type: Vitals) {
        navigateToDetailViewController(type)
    }
}

extension HomeViewController: VitalDataTableViewCellDelegate {
    func viewAllOfVitalRecordedData() {
        let info = VitalInfo(heartrate: 80.0, oxygen: 99.0, glucose: 189.0, temperature: 0.0, systolic: 120.0, diastolic: 80.0, stressLevel: 78.0, recorededDate: Date())
        navigateToViewAllRecordedViewController(vitalInfo: info, dataSource: .local)
    }
    
    func navigateToDataDetailedVitalController(_ type: Vitals) {
        
    }
}

extension HomeViewController: RecordedTableViewCellDelegate {
    func navigateToRecordedVitalDetails(_ date: String) {
        navigateToRecoredVitalsViewController()
    }
}
