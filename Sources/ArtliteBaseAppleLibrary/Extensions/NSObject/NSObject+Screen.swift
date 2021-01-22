//
//  File.swift
//  
//
//  Created by dlernatovich
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Screen height and width
@objc public extension NSObject {
    
    /// Screen height
    static var afGlobalScreenHeight: CGFloat { UIScreen.afScreenHeight }
    
    /// Screen width
    static var afGlobalScreenWidth: CGFloat { UIScreen.afScreenWidth }
    
    /// Screen height
    var afScreenHeight: CGFloat { NSObject.afGlobalScreenHeight }
    
    /// Screen width
    var afScreenWidth: CGFloat { NSObject.afGlobalScreenWidth }
    
}
#endif
