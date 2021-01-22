//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Add/Remove to/from parent controller
@objc public extension UIViewController {
    
    /// Method which provide the adding of the child view controller
    /// - Parameters:
    ///   - child: child
    ///   - view: UIView
    @objc func afAddChildController(child: UIViewController, to view: UIView?) {
        AFControllerHelper.addChildController(owner: self, child: child, to: view)
    }
    
    /// Method which provide the remove controller from parent
    @objc func afRemoveFromParent() {
        AFControllerHelper.removeFromParent(child: self)
    }
    
}

#endif
