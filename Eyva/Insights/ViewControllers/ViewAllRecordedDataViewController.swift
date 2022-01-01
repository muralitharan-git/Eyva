//
//  ViewAllRecordedDataViewController.swift
//  Eyva
//
//  Created by Muralitharan on 31/12/21.
//

import UIKit

class ViewAllRecordedDataViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var trackedDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
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
        let value = viewModel.getValue(type)
        cell.fillData(type: type, value: value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = Vitals.allCases[indexPath.row]
        if type.getVitalSupportState() == .yes {
            
        } else {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.contentView.shake()
        }
    }
}
