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
        return vitalType.positiveActions.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDescriptionTableViewCell") as! DetailDescriptionTableViewCell
            let idealRange = "Ideal \(vitalType.idealRange) \(vitalType.unit)"
            cell.fillData(title: vitalType.rawValue, longDesc: vitalType.longDescription, range: idealRange)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsTableViewCell") as! ActionsTableViewCell
            cell.fillData(vitalType.positiveActions[indexPath.row - 2])
            return cell
        }
    }
}
