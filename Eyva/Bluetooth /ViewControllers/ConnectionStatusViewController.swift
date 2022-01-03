//
//  ConnectionStatusViewController.swift
//  Eyva
//
//  Created by Dharani Reddy on 30/12/21.
//

import UIKit
import Gifu

class ConnectionStatusViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet private weak var initialConnectionView: UIView!
    @IBOutlet private weak var connectionProgressView: UIView!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var progressLable: UILabel!
    @IBOutlet private weak var connectionUpdateLabel: UILabel!
    @IBOutlet private weak var showResultsButton: UIButton!
    @IBOutlet private weak var animatedImageView: GIFImageView!
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        animatedImageView.prepareForAnimation(withGIFNamed: "Bluetooth-Animation")
        modifyProgressView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0, execute: {
            self.showProgress()
        })
    }
    
    // MARK: Private Methods
    private func modifyProgressView() {
        progressView.layer.cornerRadius = 14
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 14
        progressView.subviews[1].clipsToBounds = true
    }
    
    private func showProgress() {
        initialConnectionView.isHidden = true
        connectionProgressView.isHidden = false
        animatedImageView.startAnimatingGIF()
        incrementLabel(from: 0, to: 30)
        progressView.setProgress(0.3, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8, execute: {
            self.progressView.setProgress(0.5, animated: true)
            self.incrementLabel(from: 30, to: 50)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                self.progressView.setProgress(0.7, animated: true)
                self.incrementLabel(from: 50, to: 70)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                    self.progressView.setProgress(1.0, animated: true)
                    self.incrementLabel(from: 70, to: 100)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                        self.connectionSuccessful()
                    })
                })
            })
        })
    }
    
    private func incrementLabel(from startValue: Int, to endValue: Int) {
        let duration: Double = 1.0 //seconds
        DispatchQueue.global().async {
            for i in startValue ..< (endValue + 1) {
                let sleepTime = UInt32(duration/Double(endValue) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    self.progressLable.text = "\(i)%"
                }
            }
        }
    }
    
    private func connectionSuccessful() {
        progressView.isHidden = true
        showResultsButton.isHidden = false
        connectionUpdateLabel.text = "Your body has communicated with EYVA. \nAre you ready to learn what it needs?"
    }
    
    // MARK: IBActions
    @IBAction private func showResultsButton_Tapped() {
        let info = VitalInfo(heartrate: 80.0, oxygen: 99.0, glucose: 110.0, temperature: 0.0, systolic: 120.0, diastolic: 80.0, stressLevel: 40.0, recorededDate: Date(), haemoglobin: 4.5)
        navigateToViewAllRecordedViewController(vitalInfo: info, dataSource: .bluetoothDevice)
    }
}
