//
//  GenericVitalInfoTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import UIKit

class GenericVitalInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private func getAllVitalsImage(_ index: Int) -> UIImage? {
        return index % 2 == 0 ? UIImage(named: "even-all-vitals") : UIImage(named: "odd-all-vitals")
    }
  
    
}

extension GenericVitalInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 100)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Vitals.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { 
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionViewCell", for: indexPath) as! DashboardCollectionViewCell
        cell.tag = indexPath.row 
        cell.textLabel.text = Vitals.allCases[indexPath.row].rawValue
        cell.iconImageView.image = getAllVitalsImage(indexPath.row)
        
        //UIImage(named: imagesNameForMenu[indexPath.row])
        return cell
        
    }
}
