//
//  VOPhotoTableViewCell.swift
//  Create by Verdad Tech
//

import UIKit

class VOInputPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var noPhotoLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var photo: UIImage? {
        didSet {
            if let photo = photo {
                photoImageView.image = photo
            } else {
                photoImageView.image = nil
            }
            showDetails()
        }
    }
    
    var photoUrl: NSURL? {
        didSet {
            if let p = photoUrl {
//                photoImageView.sd_setImageWithURL(p)
            } else {
                photoImageView.image = nil
            }
            showDetails()
        }
    }
    
    private func showDetails() {
        if photoImageView.image == nil {
            photoImageView.isHidden = true
            noPhotoLabel.isHidden = false
        } else {
            photoImageView.isHidden = false
            noPhotoLabel.isHidden = true
        }
    }

}
