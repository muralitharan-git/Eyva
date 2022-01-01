//
//  VitalDataDetailedViewController.swift
//  Eyva
//
//  Created by Muralitharan on 31/12/21.
//

import UIKit

class VitalDataDetailedViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    private var range: ResultRange
    private var type: Vitals
    private var viewModel: InsightsViewModel
    
    init?(coder: NSCoder, range: ResultRange, type: Vitals, viewModel: InsightsViewModel) {
        self.range = range
        self.type = type
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    @IBAction func backButton_Tapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.rowHeight = UITableView.automaticDimension
    }
}


extension VitalDataDetailedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + 1 + type.getListOfActionsBasedOnResult(range).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableview.dequeueReusableCell(withIdentifier: "DataDetailedHeaderTableViewCell") as! DataDetailedHeaderTableViewCell
            let value = viewModel.getValue(type)
            cell.fillData(type: type, range: range, value: value)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
            cell.fillData("Take actions to make it better!", font: UIFont(name: "Mulish-ExtraBold", size: 15)!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsTableViewCell") as! ActionsTableViewCell
            cell.fillData(type.getListOfActionsBasedOnResult(range)[indexPath.row-2])
            return cell
        }
    }
}
