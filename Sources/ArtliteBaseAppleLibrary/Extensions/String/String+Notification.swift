//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Notification
@objc public extension NSString {
    
    /// Instance of the {@link Notification.Name}
    @objc var afNotification: Notification.Name { return Notification.Name(self as String) }
    
}

// MARK: - Notification
public extension String {
    
    /// Instance of the {@link Notification.Name}
    var afNotification: Notification.Name { return Notification.Name(self) }
    
}
#endif
