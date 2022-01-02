//
//  DashboardCollectionViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import Foundation
import UIKit


class DashboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var containerView: GradientBackgroundView!
    
    private var vitalType: Vitals!
    private var recordedState: VitalRecordedState!
    
    internal func fillData(_ type: Vitals, state: VitalRecordedState) {
        vitalType = type
        recordedState = state
        textLabel.text = type.rawValue 
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.setColors(blueGradientBG)
        iconImageView.image = vitalType.getIcon("blue")
        return
        
//        if recordedState == VitalRecordedState.none {
//            if tag % 2 == 0 {
//                containerView.setColors(pinkGradientBG)
//                iconImageView.image = vitalType.getIcon("pink")
//            } else {
//                containerView.setColors(blueGradientBG)
//                iconImageView.image = vitalType.getIcon("blue")
//            }
//        } else {
//            containerView.setColors(blueGradientBG)
//            iconImageView.image = vitalType.getIcon("blue")
//        }
    }
}

