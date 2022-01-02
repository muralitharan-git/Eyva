//
//  GenericVitalInfoTableViewCell.swift
//  Eyva
//
//  Created by Muralitharan on 30/12/21.
//

import UIKit

class GenericVitalInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    internal var vitalRecordedState: VitalRecordedState!
    
    weak var delegate: GenericVitalInfoTableViewCellDelegate?
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        viewAllButton?.setTitleColor(.white, for: .normal)
        viewAllButton?.titleLabel?.font = UIFont(name: "Mulish-SemiBold", size: 12)
    }
    
    @IBAction func viewAllButton_Tapped(_ sender: Any) {
        delegate?.viewAllButtonTapped()
    }
}

extension GenericVitalInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionViewCell", for: indexPath) as! DashboardCollectionViewCell
        cell.tag = indexPath.row
        cell.fillData(Vitals.allCases[indexPath.row], state: vitalRecordedState)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigateToSelectedVitalInfo(Vitals.allCases[indexPath.row])
    }
}

protocol GenericVitalInfoTableViewCellDelegate: AnyObject {
    func viewAllButtonTapped()
    func navigateToSelectedVitalInfo(_ type: Vitals)
}
