//
//  File.swift
//  
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

//MARK: - set color as background.
@objc public extension UIButton {
    
    /// Method which provide the set color as background.
    /// - Parameters:
    ///   - color: instance.
    @objc func setBackgroundColor(color: UIColor) {
        for state in UIControl.State.allStates { setBackgroundColor(color: color, forState: state) }
    }
    
    /// Method which provide the set color as background.
    /// - Parameters:
    ///   - color: instance.
    ///   - forState: state for button.
    @objc func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
    
}
#endif
