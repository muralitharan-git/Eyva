//
//  HomeTableViewDescriptionCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class HomeTableViewDescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    internal func fillData() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.33
        let font = UIFont(name: "Mulish-Regular", size: 13)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font as Any,
            .foregroundColor: UIColor(red: 0.71, green: 0.702, blue: 0.718, alpha: 1),
            .paragraphStyle: paragraphStyle,
            .kern: 1
        ]
       let mutableAttributedString = NSMutableAttributedString(string: "Congratulations. Your valour has brought you one step closer to Anthea’s remedial powers. Like you, we too once explored this sanctuary and stumbled upon EYVA- one of Anthea’s many secrets. \nEVYA is all knowing. It understands your joys, your sorrows and what makes your heart soar all with a simple touch. EVYA is Anthea’s gift of detection. Use it wisely. \n",
                                                               attributes: attributes)
        descriptionLabel.attributedText = mutableAttributedString
    }

}
