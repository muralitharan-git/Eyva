//
//  VitalsRecoredValueViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class VitalsRecoredValueViewController: UIViewController {
    
    // MARK: Variables
    internal var shouldShowFinish =  false
    
    // MARK: IBOutlets
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet private weak var backButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var finishViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        backButtonHeightConstraint.constant = shouldShowFinish ? 0 : 44
        finishViewHeightConstraint.constant = shouldShowFinish ? 120 : 0
    }

    @IBAction private func backButton_Tapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func finishButton_Tapped() {
        dismiss(animated: true, completion: nil)
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
