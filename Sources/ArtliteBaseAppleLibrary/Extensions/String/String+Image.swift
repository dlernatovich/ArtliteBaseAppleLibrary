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
    @objc var afImage: UIImage? { return UIImage(named: self as String) }
    
}

// MARK: - Notification
public extension String {
    
    /// Image of the string value
    var afImage: UIImage? { return UIImage(named: self) }
    
}
#endif
