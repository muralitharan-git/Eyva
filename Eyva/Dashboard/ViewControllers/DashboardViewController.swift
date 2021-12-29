//
//  DashboardViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var vitalsHeaderLabel: UILabel!
    @IBOutlet weak var descriptionLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var bluetoothConnectionButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var vitalsCollectionView: UICollectionView!
    
    private let menus = ["Heart rate", "Glucose", "Oxygen", "Temperature", "Blood Pressure"]
    private let imagesNameForMenu = ["heartrate", "glucose", "oxygen", "temperature", "bloodpressure"]
    
    private let isVitalsDataAvailable = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome "
        bluetoothConnectionButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 16)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewAllButton.titleLabel?.font = UIFont(name: "Mulish-SemiBold", size: 12)
        viewAllButton.titleLabel?.textColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUIComponents()
    }
    
    private func configureUIComponents() {
        if isVitalsDataAvailable {
            vitalsCollectionView.isHidden = false
            descriptionLabelBottomConstraint.constant = 190
            vitalsHeaderLabel.isHidden = false
        } else {
            vitalsCollectionView.isHidden = true
            descriptionLabelBottomConstraint.constant = 20
            vitalsHeaderLabel.isHidden = true
        }
        view.layoutIfNeeded()
    }
    
    @IBAction func bluetoothButton_Tapped(_ sender: Any) {
        presentBluetoothdViewController()
    }
    
    @IBAction func viewAllButton_Tapped(_ sender: Any) {
        
    }
    
    internal func presentBluetoothdViewController() {
        let storyboard = UIStoryboard(name: "Bluetooth", bundle: Bundle.main)
        let connectViewController = storyboard.instantiateViewController(withIdentifier: "BluetoothConnectViewController") as! BluetoothConnectViewController
        connectViewController.modalPresentationStyle = .fullScreen
        present(connectViewController, animated: true, completion: nil)
    }

    private func navigateToRecoredVitalsViewController() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
        let recordedViewController = storyboard.instantiateViewController(withIdentifier: "VitalsRecoredValueViewController") as! VitalsRecoredValueViewController
        navigationController?.pushViewController(recordedViewController, animated: true)
    }
    
    private func getAllVitalsImage(_ index: Int) -> UIImage? {
        return index % 2 == 0 ? UIImage(named: "even-all-vitals") : UIImage(named: "odd-all-vitals")
    }
    
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 100)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Vitals.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == vitalsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VitalsCollectionViewCell", for: indexPath) as! VitalsCollectionViewCell
            cell.fillDate(date: "29-12-2021", allVitalsImage: getAllVitalsImage(indexPath.row))
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionViewCell", for: indexPath) as! DashboardCollectionViewCell
            
            cell.textLabel.text = Vitals.allCases[indexPath.row].rawValue
            cell.iconImageView.image = UIImage(named: imagesNameForMenu[indexPath.row])
            fillGradient(view: cell, colors: getBackgroundColor(indexPath.row))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == vitalsCollectionView {
            navigateToRecoredVitalsViewController()
        } else {
            navigateToDetailViewController(Vitals.allCases[indexPath.row])
        }
    }
    
    private func fillGradient(view: UIView, colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = colors
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func getBackgroundColor(_ row: Int) -> [UIColor] {
        if row % 2 == 0 {
            return [rgb(183, 122, 187, 0.7), rgb(239, 173, 201, 0.7)]
        } else {
            return [rgb(86, 99, 140, 0.7), rgb(113, 181, 211, 0.7)]
        }
    }
}

class DashboardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
}
