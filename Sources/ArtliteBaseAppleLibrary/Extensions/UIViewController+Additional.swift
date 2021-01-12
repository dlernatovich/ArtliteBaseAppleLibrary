//
//  File.swift
//  
//
//  Created by dlernatovich on 12.01.2021.
//

import Foundation
#if os(iOS)
import UIKit

/// Extension for the {@link UIViewController}
@objc public extension UIViewController {
    
    /// Method which provide the getting of the top most visible controller
    /// - Returns: instance of the {@link UIViewController}
    @objc public func getVisibleController() -> UIViewController? {
            if self.presentedViewController == nil {
                return self
            }
            if let navigation = self.presentedViewController as? UINavigationController {
                return navigation.visibleViewController?.getVisibleController()
            }
            if let tab = self.presentedViewController as? UITabBarController {
                if let selectedTab = tab.selectedViewController {
                    return selectedTab.getVisibleController()
                }
                return tab.getVisibleController()
            }
            return self.presentedViewController?.getVisibleController()
        }
    
}

#endif
