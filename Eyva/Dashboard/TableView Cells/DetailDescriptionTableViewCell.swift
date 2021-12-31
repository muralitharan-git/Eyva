//
//  DetailDescriptionTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import UIKit

class DetailDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    internal func fillData(title: String, longDesc: String, range: String) {
        titleLabel.attributedText = getMutableAttributedString(text: title,
                                                               font: UIFont(name: "Mulish-Bold", size: 25)!,
                                                               textColor: .white,
                                                               lineHeight: 0.96)
        questionLabel.attributedText = getMutableAttributedString(text: "How doest it affect your body?",
                                                                  font: UIFont(name: "Mulish-ExtraBold", size: 17)!,
                                                                  textColor: .white,
                                                                  lineHeight: 2.34)
        descriptionLabel.attributedText = getMutableAttributedString(text: longDesc,
                                                                     font: UIFont(name: "Mulish-Regular", size: 15)!,
                                                                     textColor: .white,
                                                                     lineHeight: 1.06)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = rgb(245, 183, 215, 1.0).cgColor
    }
}
