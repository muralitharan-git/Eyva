//
//  QuestionTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    internal func fillData(_ vitalType: Vitals) {
        titleLabel.attributedText = getMutableAttributedString(text: "Ideal range of \(vitalType.rawValue) in your body",
                                                               font: UIFont(name: "Mulish-Regular", size: 15)!,
                                                               textColor: .white,
                                                               lineHeight: 1.06)
    }
}
