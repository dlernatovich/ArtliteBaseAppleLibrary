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
        show(owner: owner, style: style, title: title, titleFont: nil, message: message, messageFont: nil, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization)
    }
    
    
    /// Method which provide the show alert dialog from any place.
    /// - Parameters:
    ///   - owner: instance.
    ///   - style: alert style.
    ///   - title: value.
    ///   - titleFont: title font.
    ///   - message: value.
    ///   - messageFont: message font.
    ///   - closeButton: close button text.
    ///   - closeButtonStyle: close button style.
    ///   - customization: customization callback.
    @objc public static func show(
        owner: NSObject?,
        style: UIAlertController.Style,
        title: String?,
        titleFont: UIFont?,
        message: String,
        messageFont: UIFont?,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style,
        customization: ((_ controller: UIAlertController, _ closeButton: UIAlertAction) -> Void)?
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        if let title = title, let titleFont = titleFont {
            alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : titleFont]), forKey: "attributedTitle")
        }
        if let messageFont = messageFont {
            alert.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.font : messageFont]), forKey: "attributedMessage")
        }
        let closeAction = UIAlertAction(title: NSLocalizedString(closeButton, comment: ""), style: closeButtonStyle, handler: { (action) in
        })
        customization?(alert, closeAction)
        alert.addAction(closeAction)
        (owner?.afVisibleController ?? AFControllerHelper.getVisibleController())?.present(alert, animated: true)
    }
    
}

#endif
