//
//  VOInputArrayTableViewCell.swift
//  Create by Verdad Tech
//

import UIKit

class VOInputArrayTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    var values: [AnyObject]? {
        didSet {
            if let values = values as? [String] {
                label.text = values.joined(separator: ", ")
            } else if let values = values as? [Int] {
                label.text = values.map({ (i) -> String in
                    return "\(i)"
                }).joined(separator: ", ")
            } else if let values = values as? [NSNumber] {
                label.text = values.map({ (i) -> String in
                    return i.stringValue
                }).joined(separator: ", ")
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
