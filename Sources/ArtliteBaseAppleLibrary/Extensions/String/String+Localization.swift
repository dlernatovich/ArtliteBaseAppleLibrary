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
    
    /// Localized string.
    @objc var afLocalized: NSString { return NSLocalizedString(self as String, comment: "") as NSString }
    
}

// MARK: - Notification
public extension String {
    
    /// Localized string.
    var afLocalized: String { return NSLocalizedString(self, comment: "") }
    
}
#endif
