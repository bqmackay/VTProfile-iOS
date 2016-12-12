//
//  VOInputActionTableViewCell.swift
//  Profile
//
//  Created by Byron Mackay on 11/15/16.
//  Copyright © 2016 VerdadTech. All rights reserved.
//

import UIKit

protocol VOTableViewCell {
    func performAction(viewController: UIViewController)
}

class VOInputActionTableViewCell: UITableViewCell, VOTableViewCell {

    @IBOutlet weak var label: UILabel!
    
    var actionItems: [String] = [] {
        didSet {
            actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            for item in actionItems {
                actionSheet?.addAction(UIAlertAction(title: item, style: .default, handler: { (action) in
                    self.selectedIndex = self.actionItems.index(of: item)
                }))
            }
        }
    }
    
    var selectedIndex: Int? {
        didSet {
            if let index = selectedIndex {
                self.label.text = actionItems[index]
            }
        }
    }
    
    private var actionSheet: UIAlertController?
    
    func performAction(viewController: UIViewController) {
        if let sheet = actionSheet {
            viewController.present(sheet, animated: true, completion: nil)
        }
    }
    
}
