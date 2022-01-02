//
//  VitalDataTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import UIKit

class VitalDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewAllButton: UIButton!
    weak var delegate: VitalDataTableViewCellDelegate?
    
    
    private var vitalInfo: VitalInfo!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewAllButton.titleLabel?.font = UIFont(name: "Mulish-SemiBold", size: 12)
        viewAllButton.titleLabel?.text = "View All"
        viewAllButton.titleLabel?.textColor = .white
        headerLabel.text = "22.12.2021 | Evya reading that.."
    }
    
    internal func fillData(vitalInfo: VitalInfo) {
        
        self.vitalInfo = vitalInfo
    }
    
    @IBAction func viewAllButton_Tapped(_ sender: Any) {
        delegate?.viewAllOfVitalRecordedData()
    }
}

extension VitalDataTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 80)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Vitals.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VitalsDataCollectionViewCell", for: indexPath) as! VitalsDataCollectionViewCell
        cell.tag = indexPath.row
        let type = Vitals.allCases[indexPath.row]
        let recordedValue = type.getRecordedValue(vitalData: vitalInfo)
        let range = type.fetchResultRange(recordedValue.0, value2: recordedValue.1)
        let displayValue = type.getValue(vitalInfo)
        cell.fillData(type, range: range, value: displayValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigateToDataDetailedVitalController(Vitals.allCases[indexPath.row])
    }
}

protocol VitalDataTableViewCellDelegate: AnyObject {
    func viewAllOfVitalRecordedData()
    func navigateToDataDetailedVitalController(_ type: Vitals)
}
