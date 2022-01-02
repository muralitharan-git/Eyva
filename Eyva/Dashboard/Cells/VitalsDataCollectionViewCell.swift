//
//  VitalsDataCollectionViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import UIKit

class VitalsDataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var containerView: GradientBackgroundView!
    
    private var vitalType: Vitals!
    private var resultRange: ResultRange!
    
    internal func fillData(_ type: Vitals, range: ResultRange, value: String) {
        self.vitalType = type
        typeLabel.text = type.rawValue
        unitLabel.text = type.unit
        valueLabel.text = value
        resultRange = range
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if vitalType.getVitalSupportState() == .no {
            
        } else {
            if resultRange == .normal {
                containerView.setColors(pinkGradientBG)
                typeImageView.image = vitalType.getIcon("pink")
            } else {
                containerView.setColors(brownGradientBG)
                typeImageView.image = vitalType.getIcon("white")
            }
        }
    }
}


