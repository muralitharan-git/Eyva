//
//  RecordedTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import UIKit

class RecordedTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    internal weak var delegate: RecordedTableViewCellDelegate?
    
    private var listOfVitalsInfo: [VitalInfo] = []
    
    internal func fillData(_ listOfVitalInfo: [VitalInfo]) {
        self.listOfVitalsInfo = listOfVitalInfo
    }
}

extension RecordedTableViewCell: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 80)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfVitalsInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VitalsCollectionViewCell", for: indexPath) as! VitalsCollectionViewCell
        cell.tag = indexPath.row
        let info = listOfVitalsInfo[indexPath.row]
        let date = getDateInString(info.recorededDate)
        cell.fillDate(date: date)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigateToRecordedVitalDetails(listOfVitalsInfo[indexPath.row])
    }
}

protocol RecordedTableViewCellDelegate: AnyObject {
    func navigateToRecordedVitalDetails(_ vitalInfo: VitalInfo)
}
