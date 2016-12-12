//
//  AuthViewController.swift
//  Created by Verdad Tech
//

/**
    The brains behind the view controllers
*/

import UIKit

class UserProfilePresenter {

    weak var delegate: UserProfilePresenterDelegate?

    /**
        The model used in the profile view
    */
    var user: User?

    init() {
        user = User()
        user?.name = "Bobby Newton"
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UserProfilePresenter.updateParameter(_:)), name: notificationNameProfileTextChanged, object: nil)
    }

    /**
        Sends the user received up to the server and returns the results to the view controller

        @params user - the User object that should be saved on the server
    */
    func updateProfile(user: User) {
//        User.updateUser(user) { (response, user) in
//            self.delegate?.updateCompleted(user != nil)
//        }
    }

    /**
        Builds an error alert that can be displayed by a view controller

        @return an alert controller that contains a simple title and message with a single button
    */
    func buildErrorAlert() -> UIAlertController {
        return showAlert(title: "Whoops!", message: "Something didn't go right when trying to save this user. Please try again later.")
    }

    private func showAlert(title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        return alert
    }

    //MARK: NSNotification Selector
//    func updateParameter(notification: NSNotification) {
//        guard let key = notification.userInfo?[userInfoKeyProfileModelKey] as? String,
//            value = notification.userInfo?[userInfoKeyProfileModelValue] else {
//                return
//        }
//        user.update(UserParams(rawValue: key), value: value)
//    }
}

protocol UserProfilePresenterDelegate: class {
    func updateCompleted(isSuccessful: Bool)
}
