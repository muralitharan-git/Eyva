//
//  QuestionTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    internal func fillData(_ text: String, font: UIFont) {
        
        titleLabel.attributedText = getMutableAttributedString(text: text,
                                                               font: font,
                                                               textColor: .white,
                                                               lineHeight: 1.06)
    }
}
