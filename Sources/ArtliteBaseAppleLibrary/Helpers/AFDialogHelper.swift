//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Helper which provide to dialog shown
@objc public class AFDialogHelper: NSObject {
    
    /// Method which provide the show alert dialog from any place.
    @objc public static func showDialog(
        title: String?,
        message: String,
        closeButton: String
    ){
        self.show(style: .alert, title: title, message: message, closeButton: closeButton, closeButtonStyle: .default, customization: nil)
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc public static func showDialog(
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style = .default,
        customization: ((_ controller: UIAlertController, _ closeButton: UIAlertAction) -> Void)? = nil
    ){
        show(style: .alert, title: title, message: message, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization)
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc public static func showActionSheet(
        title: String?,
        message: String,
        closeButton: String
    ){
        show(style: .actionSheet, title: title, message: message, closeButton: closeButton, closeButtonStyle: .default, customization: nil)
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc public static func showActionSheet(
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style = .default,
        customization: ((_ controller: UIAlertController, _ closeButton: UIAlertAction) -> Void)? = nil
    ){
        show(style: .actionSheet, title: title, message: message, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization)
    }
    
    /// Method which provide the show alert dialog from any place.
    /// - Parameters:
    ///   - style: dialog style
    ///   - title: title value
    ///   - message: message value
    ///   - closeButton: close buttin message
    ///   - closeButtonStyle: close button style (default is UIAlertAction.Style.default)
    ///   - customization: customization callback
    @objc public static func show(
        style: UIAlertController.Style,
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style,
        customization: ((_ controller: UIAlertController, _ closeButton: UIAlertAction) -> Void)?
    ) {
        show(owner: nil, style: style, title: title, message: message, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization)
    }
    
    /// Method which provide the show alert dialog from any place.
    /// - Parameters:
    ///   - style: dialog style
    ///   - title: title value
    ///   - message: message value
    ///   - closeButton: close buttin message
    ///   - closeButtonStyle: close button style (default is UIAlertAction.Style.default)
    ///   - customization: customization callback
    @objc public static func show(
        owner: NSObject?,
        style: UIAlertController.Style,
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style,
        customization: ((_ controller: UIAlertController, _ closeButton: UIAlertAction) -> Void)?
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let closeAction = UIAlertAction(title: NSLocalizedString(closeButton, comment: ""), style: closeButtonStyle, handler: { (action) in
        })
        alert.addAction(closeAction)
        customization?(alert, closeAction)
        (owner?.afVisibleController ?? AFControllerHelper.getVisibleController())?.present(alert, animated: true)
    }
    
}
#endif
