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
    @objc public func getVisibleController() -> UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController?.getVisibleController()
    }
    
}
#endif
