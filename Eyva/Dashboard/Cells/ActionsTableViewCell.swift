//
//  ActionsTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import UIKit

class ActionsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    internal func fillData(_ type: Vitals) {
        titleLabel.attributedText = getMutableAttributedString(text: type.idealRangeVerbiage,
                                                               font: UIFont(name: "Mulish-SemiBold", size: 15)!,
                                                               textColor: .white,
                                                               lineHeight: 1.59)
    }
}
