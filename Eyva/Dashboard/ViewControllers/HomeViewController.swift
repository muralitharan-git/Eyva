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
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.getVitalRecords()
        fillUsername()
        tableView.rowHeight = UITableView.automaticDimension
        fillSubHeaderLabel()
        topImageView.image = UIImage(named: "homepage-top")
        actionButton.setImage(UIImage(named: "connect-button-bg"), for: .normal)
    }
    
    private func fillUsername() {
        let attributedString = getMutableAttributedString(text: "Welcome, ", font: UIFont(name: "Mulish-ExtraBold", size: 25)!, textColor: .white, lineHeight: 1.0)
        attributedString.append(getMutableAttributedString(text: sharedCoreDataManager.fetchUserName(), font: UIFont(name: "Mulish-ExtraBold", size: 25)!, textColor: rgb(166, 133, 218, 1.0), lineHeight: 1.0))
        welcomeLabel.attributedText = attributedString
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeViewModel.getVitalRecords()
        tableView.reloadData()
        updateUIComponents()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        actionButton.applyGradient(colors: [rgb(183, 92, 255, 1.0).cgColor, rgb(103, 26, 228, 1.0).cgColor])
//        actionButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 17)
//        actionButton.setTitleColor(.white, for: .normal)
    }
    
    private func fillSubHeaderLabel() {
        subHeaderLabel.isHidden = true
        subHeaderLabel.attributedText = getMutableAttributedString(text: "The flowers of Anthea are slowly withering to reflect your inner body. Help them bloom again.", font: UIFont(name: "Mulish-Regular", size: 12)!, textColor: .white, lineHeight: 1.33)
    }
    
    private func updateUIComponents() {
        if homeViewModel.isNotNormalRange {
            topImageView.image = UIImage(named: "homepage-sad-top")
            subHeaderLabel.isHidden = false
        } else {
            topImageView.image = UIImage(named: "homepage-top")
            subHeaderLabel.isHidden = true
        }
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
        return 350
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let rect = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 350)
        let headerView = UIView(frame: rect)
//        let backgroundImage = UIImageView(frame: rect)
//        backgroundImage.image = UIImage(named: "homepage-top")
//        headerView.addSubview(backgroundImage)
        headerView.backgroundColor = UIColor.clear
        return headerView
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
                cell.fillData(vitalInfo: homeViewModel.getFirstRecord()!)
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RecordedTableViewCell") as! RecordedTableViewCell
                cell.delegate = self
                cell.fillData(homeViewModel.vitalRecords)
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenericVitalInfoTableViewCell") as! GenericVitalInfoTableViewCell
            cell.vitalRecordedState = homeViewModel.recordedState
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
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
    func viewAllOfVitalRecordedData(_ vitalInfo: VitalInfo) {
        navigateToViewAllRecordedViewController(vitalInfo: vitalInfo, dataSource: .local)
    }
    
    func navigateToDataDetailedVitalViewController(_ type: Vitals, range: ResultRange, viewModel: InsightsViewModel) {
        navigateToDataDetailedViewController(range: range, type: type, viewModel: viewModel)
    }
}

extension HomeViewController: RecordedTableViewCellDelegate {
    func navigateToRecordedVitalDetails(_ vitalInfo: VitalInfo) {
        navigateToViewAllRecordedViewController(vitalInfo: vitalInfo, dataSource: .local)
    }
}
