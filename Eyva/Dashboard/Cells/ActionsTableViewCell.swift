//
//  ActionsTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import UIKit

class ActionsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    internal func fillData(_ desc: String) {
        titleLabel.text = desc
    }
}
