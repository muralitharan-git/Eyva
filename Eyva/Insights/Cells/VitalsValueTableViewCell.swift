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
    
    internal func fillData(type: Vitals, value: String) {
        iconImageView.image = type.getIcon("white")
        unitLabel.text = type.unit
        typeLabel.text = type.rawValue
        valueLabel.text = value
    }
}
