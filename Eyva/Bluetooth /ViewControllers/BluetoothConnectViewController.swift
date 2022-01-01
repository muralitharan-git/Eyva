//
//  BluetoothConnectViewController.swift
//  Eyva
//
//  Created by Dharani Eyva on 26/12/21.
//

import UIKit

class BluetoothConnectViewController: UIViewController {

    // MARK: IBOutelts
    @IBOutlet private weak var connectLabel: UILabel!
    @IBOutlet private weak var meetEyvaButton: UIButton!
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var bottomSheetTopConstraint: NSLayoutConstraint!
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        fillGradient()
    }
    
    // MARK: Private Methods
    private func fillGradient() {
        let layer0 = CAGradientLayer()
        layer0.frame = gradientView.bounds
        layer0.colors = [
            UIColor(red: 0.076, green: 0, blue: 0.371, alpha: 1).cgColor,
          UIColor(red: 0.144, green: 0, blue: 0.283, alpha: 1).cgColor,
          UIColor(red: 0, green: 0.016, blue: 0.157, alpha: 1).cgColor
        ]
        layer0.locations = [0, 0.55, 1]
        gradientView.layer.insertSublayer(layer0, at: 0)
    }
    
    // MARK: IBActions
    @IBAction func backButton_Tapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func connectButton_Tapped(button: UIButton) {
        button.isUserInteractionEnabled = false
        connectLabel.text = "Connecting"
        backgroundImageView.image = UIImage(named: "bluetooth-connecting")
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.connectLabel.text = "Connected"
            self.backgroundImageView.image = UIImage(named: "bluetooth-connected")
            self.meetEyvaButton.isHidden = false
        })
    }
    
    @IBAction private func meetEyvaButton_Tapped() {
        animateBottomView(with: -676)
    }
    
    @IBAction private func startButton_Tapped() {
        animateBottomView(with: 0)
        let connectionStatusViewController = UIStoryboard(name: "Bluetooth", bundle: nil).instantiateViewController(withIdentifier: "ConnectionStatusViewController")
        navigationController?.pushViewController(connectionStatusViewController, animated: true)
    }
    
    // MARK: Private Methods
    private func animateBottomView(with value: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bottomSheetTopConstraint.constant = value
            self.view.layoutIfNeeded()
        })
    }
}
