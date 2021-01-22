//
//  File.swift
//  
//
//  Created by dlernatovich
//

import Foundation
#if os(iOS)
import UIKit

//MARK: - Get screen height and width
@objc public extension UIScreen {
    
    /// Screen height
    static var afScreenHeight: CGFloat { return UIScreen.main.bounds.height }
    
    /// Screen width
    static var afScreenWidth: CGFloat { return UIScreen.main.bounds.width }
    
}
#endif
