//
//  AFKeyboardHelper.swift
//  ExampleApplication
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Keyboard helper
@objc public class AFKeyboardHelper: NSObject {
    
    /// Hide keyboard from view
    /// - Parameter view: instance of the {@link UIView}
    @objc static func hide() {
        hide(view: AFControllerHelper.getVisibleController()?.view)
    }
    
    /// Hide keyboard from view
    /// - Parameter view: instance of the {@link UIView}
    @objc static func hide(view: UIView?) {
        guard let view = view else { return }
        view.endEditing(true)
    }
    
}
#endif
