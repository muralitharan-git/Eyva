//
//  ViewAllVitalsTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 31/12/21.
//

import UIKit

class ViewAllVitalsTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    
    internal func fillData(_ type: Vitals) {
        typeLabel.text = type.rawValue
        typeImageView.image = type.getIcon("white")
    }
    
    @IBAction func detailButton_Tapped(_ sender: Any) {
        
    }
}

