//
//  VitalsCollectionViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class VitalsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: GradientBackgroundView!
    @IBOutlet weak var allVitalsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    internal func fillDate(date: String) {
        dateLabel.text = date
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if tag % 2 == 0 {
            containerView.setColors(pinkGradientBG)
            allVitalsImageView.image = UIImage(named: "even-all-vitals")
        } else {
            containerView.setColors(blueGradientBG)
            allVitalsImageView.image = UIImage(named: "odd-all-vitals")
        }
    }
}
