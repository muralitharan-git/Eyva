//
//  VitalsCollectionViewCell.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class VitalsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var allVitalsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    internal func fillDate(date: String, allVitalsImage: UIImage?) {
        allVitalsImageView.image = allVitalsImage
        dateLabel.text = date
    }
}
