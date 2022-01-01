//
//  DetailViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    internal var vitalType: Vitals = .bloodPressure
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }
    
    @IBAction func backButton_Tapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vitalType.idealRangeVerbiage.count > 0 ? 3 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDescriptionTableViewCell") as! DetailDescriptionTableViewCell
            let idealRange = "Ideal \(vitalType.idealRange) \(vitalType.unit)"
            cell.fillData(title: vitalType.rawValue, longDesc: vitalType.longDescription, range: idealRange)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
            let title = "Ideal range of \(vitalType.rawValue) in your body"
            cell.fillData(title, font: UIFont(name: "Mulish-Regular", size: 15)!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsTableViewCell") as! ActionsTableViewCell
            cell.fillData(vitalType.idealRangeVerbiage)
            return cell
        }
    }
}
