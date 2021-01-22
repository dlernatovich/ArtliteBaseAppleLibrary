//
//  File.swift
//  
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Visibility functional (public part)
@objc public extension UIViewController {
    
    /// Method which provide the getting of the top most visible controller
    /// - Returns: instance of the {@link UIViewController}
    @objc override var afVisibleController: UIViewController? { return AFControllerHelper.getVisibleController(controller: self) }
    
    /// Check if current controller is visible.
    var afIsVisible: Bool { return (afVisibleController == self) }
    
}

#endif
