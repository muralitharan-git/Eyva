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
    
    internal func fillData(type: Vitals, value: String) {
        iconImageView.image = type.getIcon("white")
        unitLabel.text = type.unit
        typeLabel.text = type.rawValue
        valueLabel.text = value
        let buttonImage = type.getVitalSupportState() == .yes ? UIImage(named: "right-arrow") : UIImage(named: "lock-icon")
        nextButton.setImage(buttonImage, for: .normal)
    }
}
