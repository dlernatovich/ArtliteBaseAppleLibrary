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
    
    /// Image of the string value
    @objc var afColor: UIColor? { return UIColor(named: self as String) }
    
}

// MARK: - Notification
public extension String {
    
    /// Image of the string value
    var afColor: UIColor? {
        return UIColor(named: self)
    }
    
}
#endif
