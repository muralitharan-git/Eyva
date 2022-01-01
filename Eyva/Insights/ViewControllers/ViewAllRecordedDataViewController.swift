//
//  ViewAllRecordedDataViewController.swift
//  Eyva
//
//  Created by Muralitharan on 31/12/21.
//

import UIKit

class ViewAllRecordedDataViewController: UIViewController {
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var trackedDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backButtonTopConstraint: NSLayoutConstraint!
    
    private var viewModel: InsightsViewModel
    
    init?(coder: NSCoder, vitalInfo: VitalInfo, dataSource: VitalsDataSource) {
        self.viewModel = InsightsViewModel(vitalsInfo: vitalInfo, dataSource: dataSource)
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackedDateLabel.text = viewModel.getTrackedDate()
        nameLabel.attributedText = viewModel.getHeaderDetails()
        finishButton.setTitle("Finish", for: .normal)
        finishButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 16)
        finishButton.isHidden = viewModel.dataSource != .bluetoothDevice
        backButton.isHidden = viewModel.dataSource == .bluetoothDevice
        backButtonTopConstraint.constant = viewModel.dataSource == .bluetoothDevice ? 20 : 78
    }
    
    @IBAction func finishButton_Tapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton_Tapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ViewAllRecordedDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Vitals.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VitalsValueTableViewCell") as! VitalsValueTableViewCell
        let type = Vitals.allCases[indexPath.row]
        let range = getRangeForType(type)
        let value = viewModel.getValue(type)
        cell.fillData(type: type, value: value, range: range)
        return cell
    }
    
    private func getRangeForType(_ type: Vitals) -> ResultRange {
        let recordedValue = viewModel.getRecordedValue(type)
        let range = type.fetchResultRange(recordedValue.0, value2: recordedValue.1)
        return range
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = Vitals.allCases[indexPath.row]
        if type.getVitalSupportState() == .yes {
            let insightsStoryBoard = UIStoryboard(name: "Insights", bundle: nil)
            let detailViewController = insightsStoryBoard.instantiateViewController(identifier: "VitalDataDetailedViewController", creator: { coder in
                return VitalDataDetailedViewController(coder: coder, range: self.getRangeForType(type), type: type, viewModel: self.viewModel)
            })
            navigationController?.pushViewController(detailViewController,
                                                     animated: true)
        } else {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.contentView.shake()
        }
    }
}
