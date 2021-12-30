//
//  RecordedTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import UIKit

class RecordedTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
   
}

extension RecordedTableViewCell: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 85)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Vitals.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VitalsCollectionViewCell", for: indexPath) as! VitalsCollectionViewCell
        cell.tag = indexPath.row 
        cell.fillDate(date: "29-12-2021")
        return cell
    }
}
