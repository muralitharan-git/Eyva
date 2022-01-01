//
//  VitalsValueTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class VitalsValueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var typeLabelTopConstraint: NSLayoutConstraint!
    
    internal func fillData(type: Vitals, value: String, range: ResultRange) {
        iconImageView.image = type.getIcon("white")
        if type.getVitalSupportState() == .yes {
            unitLabel.text = type.unit
            valueLabel.text = value
            typeLabelTopConstraint.constant = 10
            updateBackgroundColorOfContainerView(range)
        } else {
            unitLabel.text = ""
            valueLabel.text = ""
            typeLabelTopConstraint.constant = 28
            updateBackgroundColorOfContainerView(.normal)
        }
        
        typeLabel.text = type.rawValue
        let buttonImage = type.getVitalSupportState() == .yes ? UIImage(named: "right-arrow") : UIImage(named: "lock-icon")
        nextButton.setImage(buttonImage, for: .normal)
       
    }
    
    private func updateBackgroundColorOfContainerView(_ range: ResultRange) {
        if range == .normal {
            self.containerView.layer.borderWidth = 0
            containerView.backgroundColor = rgb(55, 50, 84, 1.0)
        } else {
            containerView.backgroundColor = rgb(121, 61, 97, 1.0)
            containerView.layer.borderWidth = 3
            containerView.layer.borderColor = rgb(199, 114, 114, 1.0).cgColor
        }
    }
    
}
