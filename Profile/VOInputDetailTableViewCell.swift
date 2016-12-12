//
//  VOInputDetailsTableViewCell.swift
//  Profile
//
//  Created by Byron Mackay on 11/15/16.
//  Copyright © 2016 VerdadTech. All rights reserved.
//

import UIKit

class VOInputDetailTableViewCell: UITableViewCell, VOTableViewCell {

    @IBOutlet weak var label: UILabel!
    
    var viewControllerToPush: UIViewController?

    func performAction(viewController: UIViewController) {
        if let vc = viewControllerToPush {
            viewController.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("You need to add a view controller to viewControllerToPush inside your VOInputDetailsTableViewCell")
        }
    }
    
}
