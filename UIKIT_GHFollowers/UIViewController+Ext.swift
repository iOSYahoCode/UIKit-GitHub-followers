//
//  UIViewController+Ext.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 14.10.2025.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(alertTitle: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
