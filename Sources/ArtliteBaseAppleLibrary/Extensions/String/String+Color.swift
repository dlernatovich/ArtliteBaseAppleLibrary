//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Color (Objective C)
@objc public extension NSString {
    
    /// UIColor from name
    @objc var afColor: UIColor? { return UIColor(named: self as String) }
    
}

// MARK: - Color (Swift)
public extension String {
    
    /// UIColor from name
    var afColor: UIColor? { UIColor(named: self) }
    
    /// UIColor from hex string
    var afHexColor: UIColor? { UIColor(hex: self) }
    
}
#endif
