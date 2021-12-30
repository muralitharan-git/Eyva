//
//  HomeViewController.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundOverlay-Image-test"))
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView?.frame.size = CGSize(width: tableView.frame.width, height: 300)
    }
    
    @IBAction func bluetoothButton_Tapped(_ sender: Any) {
        presentBluetoothdViewController()
    }
    
    internal func presentBluetoothdViewController() {
        let storyboard = UIStoryboard(name: "Bluetooth", bundle: Bundle.main)
        let connectViewController = storyboard.instantiateViewController(withIdentifier: "BluetoothConnectViewController") as! BluetoothConnectViewController
        connectViewController.modalPresentationStyle = .fullScreen
        present(connectViewController, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let rect = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 300)
        let footerView = UIView(frame:rect)
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewDescriptionCell") as! HomeTableViewDescriptionCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecordedTableViewCell") as! RecordedTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenericVitalInfoTableViewCell") as! GenericVitalInfoTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

