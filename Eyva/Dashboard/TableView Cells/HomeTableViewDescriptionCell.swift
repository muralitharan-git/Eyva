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
        descriptionLabel.attributedText =  getMutableAttributedString(text: "Congratulations. Your valour has brought you one step closer to Anthea’s remedial powers. Like you, we too once explored this sanctuary and stumbled upon EYVA- one of Anthea’s many secrets. \nEVYA is all knowing. It understands your joys, your sorrows and what makes your heart soar all with a simple touch. EVYA is Anthea’s gift of detection. Use it wisely. \n",
                                                                      font: UIFont(name: "Mulish-Regular", size: 12)!, textColor: rgb(181, 179, 183, 1.0), lineHeight: 1.33)
    }

}
