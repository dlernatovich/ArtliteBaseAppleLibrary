//
//  File.swift
//  
//
//  Created by dlernatovich
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Visible controller
@objc public extension NSObject {
    
    /// Method which provide the getting of the top most visible controller
    /// - Returns: instance of the {@link UIViewController}
    @objc var afVisibleController: UIViewController? { return AFControllerHelper.getVisibleController() }
    
}
#endif
