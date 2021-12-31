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
   
    @IBOutlet weak var descriptionLabel: UILabel!
    
    internal func fillData(title: String, longDesc: String, range: String) {
        titleLabel.text = title
       // idealRangeLabel.text = range
        descriptionLabel.text = longDesc
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.borderWidth = 2.0
        containerView.layer.borderColor = rgb(245, 183, 215, 1.0).cgColor
    }
}
