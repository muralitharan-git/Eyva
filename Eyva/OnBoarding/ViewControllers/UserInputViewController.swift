//
//  UserInputViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 26/12/21.
//

import UIKit

var userName = "Murali"

class UserInputViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actionButton: CustomButton!
    
    private let questions: [String] = ["What do you want to be called in this world?", "Email ID", "How old are you?"]
    private var answers: [String] = ["", "", ""]
    private let keyboardTypes: [UIKeyboardType] = [.asciiCapable, .emailAddress, .numberPad]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 20)
        configureButtons()
        view.enableTapToDismissKeyboard()
    }
    
    private func configureButtons() {
        actionButton.setBackgroundColor(rgb(48, 20, 88, 1.0), for: .disabled)
        actionButton.setBackgroundColor(rgb(183, 92, 255, 1.0), for: .normal)
    }
    
    @IBAction func actionButton_Tapped(_ sender: Any) {
        navigateToDashboardViewController()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        answers[textField.tag] = textField.text  ?? ""
        updateCTAButtonStateBasedOnData()
        
        if textField.tag == 0 {
            userName = textField.text ?? ""
        }
    }
    
    private func updateCTAButtonStateBasedOnData() {
        let isInRange = answers.filter { $0.count > 0 }.count == 3
        actionButton.isEnabled = isInRange
    }
}

extension UserInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInputCell") as! UserInputCell
        cell.textField.keyboardType = keyboardTypes[indexPath.row]
        cell.textField.text = answers[indexPath.row]
        cell.titleLabel.text = questions[indexPath.row]
        cell.textField.tag = indexPath.row
        cell.textField.addTarget(self, action: #selector(UserInputViewController.textFieldDidChange(_:)), for: .editingChanged)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}


class UserInputCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.layer.cornerRadius = 22
        textField.layer.masksToBounds = true
    }
}


