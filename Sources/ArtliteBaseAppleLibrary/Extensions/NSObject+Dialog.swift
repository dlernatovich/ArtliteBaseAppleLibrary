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
    
    /// Method which provide the show alert dialog from any place.
    @objc func afDialog(
        title: String,
        message: String,
        closeButton: String
    ){
        self.show(style: .alert, title: title, message: message, closeButton: closeButton, closeButtonStyle: .default, customization: nil);
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc func afDialog(
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style = .default,
        customization: ((_ controller: UIAlertController) -> Void)? = nil
    ){
        self.show(style: .alert, title: title, message: message, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization);
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc func afActionSheet(
        title: String?,
        message: String,
        closeButton: String
    ){
        self.show(style: .actionSheet, title: title, message: message, closeButton: closeButton, closeButtonStyle: .default, customization: nil);
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc func afActionSheet(
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style = .default,
        customization: ((_ controller: UIAlertController) -> Void)? = nil
    ){
        self.show(style: .actionSheet, title: title, message: message, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization);
    }
    
    /// Method which provide the show alert dialog from any place.
    /// - Parameters:
    ///   - style: dialog style
    ///   - title: title value
    ///   - message: message value
    ///   - closeButton: close buttin message
    ///   - closeButtonStyle: close button style (default is UIAlertAction.Style.default)
    ///   - customization: customization callback
    @objc private func show(
        style: UIAlertController.Style,
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style,
        customization: ((_ controller: UIAlertController) -> Void)?
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: NSLocalizedString(closeButton, comment: ""), style: closeButtonStyle, handler: { (action) in
            
        }))
        customization?(alert)
        self.afVisibleController?.present(alert, animated: true);
    }
    
}
#endif
