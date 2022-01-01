//
//  ActionsTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import UIKit

class ActionsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    internal func fillData(_ text: String) {
        titleLabel.attributedText = getMutableAttributedString(text: text,
                                                               font: UIFont(name: "Mulish-Regular", size: 15)!,
                                                               textColor: .white,
                                                               lineHeight: 1.06)
    }
}
