//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Notificalion model class.
@objc public class AFNotificationModel: NSObject {
    
    /// Name of the notification.
    internal let name: String
    
    /// Default constructor.
    /// - Parameter name: value.
    public init(name: String) { self.name = name }
    
}

#endif
