//
//  Alert.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import UIKit

class AlertController {
    
    static let shared = AlertController()
    
    func showAlert(title: String, message: String, controller: UIViewController, completion:(() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { action in
            completion?()
        }
        alertController.addAction(alertAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}
