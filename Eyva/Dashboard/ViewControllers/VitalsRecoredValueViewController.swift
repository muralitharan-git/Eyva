//
//  VitalsRecoredValueViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class VitalsRecoredValueViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButton_Tapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension VitalsRecoredValueViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Vitals.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VitalsValueTableViewCell") as! VitalsValueTableViewCell
        cell.typeLabel.text = Vitals.allCases[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetailViewController(Vitals.allCases[indexPath.row])
    }
}
