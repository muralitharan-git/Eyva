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
    
    internal func fillData(_ type: Vitals) {
        self.vitalType = type
        typeLabel.text = type.rawValue
        unitLabel.text = type.unit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if tag % 2 == 0 {
            containerView.setColors(pinkGradientBG)
            typeImageView.image = vitalType.getIcon("pink")
        } else {
            containerView.setColors(blueGradientBG)
            typeImageView.image = vitalType.getIcon("blue")
        }
    }
}


