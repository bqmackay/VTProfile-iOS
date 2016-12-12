//
//  ProfileTableViewController.swift
//  Profile
//
//  Created by Byron Mackay on 11/15/16.
//  Copyright © 2016 VerdadTech. All rights reserved.
//

import UIKit

let cellIdentifierProfileTopCell = "ProfileTopCell"
let cellIdentifierProfileCell = "ProfileCell"

class ProfileTableViewController: UITableViewController, UserProfilePresenterDelegate {

    /**
     The model used in this profile view
    */
    private var user: User? {
        return presenter.user
    }
    
    /**
     The presenter that contains the logic for data as well as logic for error messages
    */
    private let presenter = UserProfilePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(ProfileTableViewController.updateProfile))
        
        tableView.register(UINib(nibName: String(describing: VOInputDateTableViewCell.self), bundle: nil), forCellReuseIdentifier: "date")
        tableView.register(UINib(nibName: String(describing: VOInputTextTableViewCell.self), bundle: nil), forCellReuseIdentifier: "text")
        tableView.register(UINib(nibName: String(describing: VOInputActionTableViewCell.self), bundle: nil), forCellReuseIdentifier: "action")
        tableView.register(UINib(nibName: String(describing: VOInputDetailTableViewCell.self), bundle: nil), forCellReuseIdentifier: "detail")
        
        presenter.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 4
        case 2:
            return 2
        case 3:
            return 6
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ["", "Status", "Account", "Settings"][section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! VOInputTextTableViewCell
                cell.textField.text = user?.name
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath) as! VOInputDateTableViewCell
                cell.date = Date()
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "action", for: indexPath) as! VOInputActionTableViewCell
                cell.actionItems = gender
                cell.selectedIndex = 0
                return cell
            default:
                return UITableViewCell()
            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "action", for: indexPath) as! VOInputActionTableViewCell
                cell.actionItems = occupation
                cell.selectedIndex = 0
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! VOInputTextTableViewCell
                cell.textField.text = "Work"
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! VOInputTextTableViewCell
                cell.textField.text = "5"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! VOInputTextTableViewCell
                cell.textField.text = "Job"
                return cell
            default:
                return UITableViewCell()
            }
        case 2:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! VOInputTextTableViewCell
                cell.textField.text = "email@email.com"
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! VOInputDetailTableViewCell
//                cell.viewControllerToPush = 
                cell.label.text = "Change Password"
                return cell
            default:
                return UITableViewCell()
            }
        case 3:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! VOInputDetailTableViewCell
                //                cell.viewControllerToPush =
                cell.label.text = "About"
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! VOInputDetailTableViewCell
                //                cell.viewControllerToPush =
                cell.label.text = "Terms & Conditions"
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! VOInputDetailTableViewCell
                //                cell.viewControllerToPush =
                cell.label.text = "Privacy Policy"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! VOInputDetailTableViewCell
                //                cell.viewControllerToPush =
                cell.label.text = "Contact Us"
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! VOInputDetailTableViewCell
                //                cell.viewControllerToPush =
                cell.label.text = "Share the App"
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! VOInputDetailTableViewCell
                //                cell.viewControllerToPush =
                cell.label.text = "Sign Out"
                cell.accessoryType = UITableViewCellAccessoryType.none
                return cell
            default:
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
        
        //Should never be reached
        assertionFailure()
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? VOTableViewCell
        cell?.performAction(viewController: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Selectors
    func updateProfile() {
//        MBProgressHud.showHUDAddedTo(self.view, animated: true)
        print("Updating")
        presenter.updateProfile(user: user!)
    }
    
    //MARK: UserProfilePresenterDelegate
    func updateCompleted(isSuccessful: Bool) {
        print("Updated")
//        MBProgressHud.hideAllHUDsForView(self.view, animated: true)
        if isSuccessful {
            navigationController?.popViewController(animated: true)
        } else {
            present(presenter.buildErrorAlert(), animated: true, completion: nil)
        }
    }
    
}

fileprivate let gender: [String] = ["Male", "Female"]
fileprivate let occupation: [String] = ["Student", "Professional", "Other"]
