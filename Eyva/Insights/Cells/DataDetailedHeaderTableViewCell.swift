//
//  DataDetailedHeaderTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 01/01/22.
//

import UIKit

class DataDetailedHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var idealRangeLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    internal func fillData(type: Vitals, range: ResultRange, value: String) {
        typeLabel.text = type.rawValue
        unitLabel.text = type.unit + " " + range.rawValue.uppercased()
        valueLabel.text = value
        idealRangeLabel.text = "Ideal \(type.idealRange) \(type.unit)"
        descriptionLabel.attributedText = getMutableAttributedString(text: type.getResultLongDescription(),
                                                                                                    font: UIFont(name: "Mulish-Regular", size: 15)!,
                                                                                                    textColor: .white,
                                                                                                    lineHeight: 1.06)
        
        questionLabel.attributedText = getMutableAttributedString(text: "How doest it affect your body?",
                                                                  font: UIFont(name: "Mulish-ExtraBold", size: 17)!,
                                                                  textColor: .white,
                                                                  lineHeight: 2.34)
        
        updateUIBackground(range)
    }
    
    private func updateUIBackground(_ range: ResultRange) {
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = rgb(245, 183, 215, 1.0).cgColor
        if range == .normal {
            containerView.backgroundColor = rgb(55, 50, 84, 1.0)
        } else {
            containerView.backgroundColor = rgb(121, 61, 97, 1.0)
        }
    }
    
}
