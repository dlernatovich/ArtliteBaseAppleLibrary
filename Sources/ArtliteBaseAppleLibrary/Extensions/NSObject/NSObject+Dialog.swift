//
//  File.swift
//  
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Dialog showing
@objc public extension NSObject {
    
    /// Method which provide the show alert dialog from any place.
    @objc func afDialog(
        title: String?,
        message: String,
        closeButton: String
    ){
        AFDialogHelper.show(owner: self,style: .alert, title: title, message: message, closeButton: closeButton, closeButtonStyle: .default, customization: nil)
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc func afDialog(
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style = .default,
        customization: ((_ controller: UIAlertController) -> Void)? = nil
    ){
        AFDialogHelper.show(owner: self,style: .alert, title: title, message: message, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization)
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc func afActionSheet(
        title: String?,
        message: String,
        closeButton: String
    ){
        AFDialogHelper.show(owner: self,style: .actionSheet, title: title, message: message, closeButton: closeButton, closeButtonStyle: .default, customization: nil)
    }
    
    /// Method which provide the show alert dialog from any place.
    @objc func afActionSheet(
        title: String?,
        message: String,
        closeButton: String,
        closeButtonStyle: UIAlertAction.Style = .default,
        customization: ((_ controller: UIAlertController) -> Void)? = nil
    ){
        AFDialogHelper.show(owner: self,style: .actionSheet, title: title, message: message, closeButton: closeButton, closeButtonStyle: closeButtonStyle, customization: customization)
    }
    
}
#endif
