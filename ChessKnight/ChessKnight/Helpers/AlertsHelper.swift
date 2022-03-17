//
//  AlertsHelper.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 17/3/22.
//

import UIKit

class AlertsHelper {

    static func createAlert(title: String,
                            message: String,
                            viewController: UIViewController) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async {
            viewController.present(alertController, animated: true)
        }
    }
}
