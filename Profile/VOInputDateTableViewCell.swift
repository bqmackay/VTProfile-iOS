//
//  VOInputDateTableViewCell.swift
//  Create by Verdad Tech
//

import UIKit

class VOInputDateTableViewCell: UITableViewCell, VOTableViewCell {

    @IBOutlet weak var dateLabel: NoCursorTextField!
    
    var date: Date? {
        didSet {
            guard let date = date else {
                dateLabel.text = "Select Date"
                return
            }
            let formatter = DateFormatter()
            switch dateType {
            case .dateAndTime:
                formatter.dateFormat = "EEEE, MMM dd"
            default:
                formatter.dateFormat = "MMMM dd, yyyy"
            }
            dateLabel.text = formatter.string(from: date as Date)
        }
    }
    
    var dateType: UIDatePickerMode = UIDatePickerMode.date
    
    let datePickerView: UIDatePicker = UIDatePicker()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        datePickerView.datePickerMode = dateType
        datePickerView.addTarget(self, action: #selector(VOInputDateTableViewCell.updateDate(sender:)), for: .valueChanged)
        dateLabel.inputView = datePickerView
    }
    
    func performAction(viewController: UIViewController) {
        dateLabel.becomeFirstResponder()
    }
    
    func updateDate(sender: UIDatePicker) {
        date = sender.date
    }
}

class NoCursorTextField: UITextField {
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
}
