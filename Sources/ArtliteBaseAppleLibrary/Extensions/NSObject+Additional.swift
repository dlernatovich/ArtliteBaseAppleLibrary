//
//  File.swift
//  
//
//  Created by dlernatovich on 12.01.2021.
//

import Foundation
#if os(iOS)
import UIKit

/// Extension for the {@link NSObject}
@objc public extension NSObject {
    
    /// Method which provide the getting of the top most visible controller
    /// - Returns: instance of the {@link UIViewController}
    @objc var afVisibleController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController?.getVisibleController()
        }
    }
    
}

/// Extension for the {@link NSObject}
@objc public extension NSObject {
    
    /// Method which provide the show alert dialog from any place.
    /// - Parameters:
    ///   - style: dialog style
    ///   - title: title value
    ///   - message: message value
    ///   - closeButton: close buttin message
    ///   - closeButtonStyle: close button style (default is UIAlertAction.Style.default)
    ///   - customization: customization callback
    @objc func showDialog(
        style: UIAlertController.Style = .alert,
        title: String? = nil,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style = .default,
        customization: ((UIAlertController) -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: NSLocalizedString(closeButton, comment: ""), style: closeButtonStyle, handler: { (action) in
            
        }))
        customization?(alert)
        self.afVisibleController?.present(alert, animated: true);
    }
    
}
#endif
