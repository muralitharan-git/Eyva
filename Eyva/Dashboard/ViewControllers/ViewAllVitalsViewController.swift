//
//  ViewAllVitalsViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class ViewAllVitalsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.attributedText = getMutableAttributedString(text: "Understand how the Vitals affect your body",
                                                                font: UIFont(name: "Mulish-Regular", size: 13)!,
                                                                textColor: .white,
                                                                lineHeight: 2.45)
    }


    @IBAction func backButton_tapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ViewAllVitalsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewAllVitalsTableViewCell") as! ViewAllVitalsTableViewCell
        cell.fillData(Vitals.allCases[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Vitals.allCases.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetailViewController(Vitals.allCases[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
