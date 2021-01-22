//
//  File.swift
//  
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

//MARK: - Corner radius
@objc public extension UIView {
    
    /// Corner radius
    @IBInspectable
    var cornerRadius: CGFloat {
        set { self.layer.cornerRadius = newValue }
        get { self.layer.cornerRadius }
    }
    
}
#endif
