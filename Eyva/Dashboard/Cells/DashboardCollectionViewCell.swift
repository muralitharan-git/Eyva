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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let pinkcolors = [
            UIColor(red: 0.718, green: 0.478, blue: 0.733, alpha: 1).cgColor,
            UIColor(red: 0.937, green: 0.678, blue: 0.788, alpha: 1).cgColor
          ]
        let blueColors = [
            UIColor(red: 0.337, green: 0.388, blue: 0.549, alpha: 1).cgColor,
            UIColor(red: 0.443, green: 0.71, blue: 0.827, alpha: 1).cgColor
          ]
        if tag % 2 == 0 {
            containerView.setColors(pinkcolors)
        } else {
            containerView.setColors(blueColors)
        }
    }
    
    
}
