//
//  Alerts.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//


import Foundation
import UIKit

func showErrorAlert(message: String, controller: UIViewController){
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    controller.present(alert, animated: true)
}
