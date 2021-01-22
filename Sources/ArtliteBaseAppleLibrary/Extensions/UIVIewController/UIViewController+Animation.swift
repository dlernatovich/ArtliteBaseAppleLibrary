//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Animation functional
@objc public extension UIViewController {
    
    /// Method which provide the animate functional.
    /// - Parameters:
    ///   - time: value
    ///   - action: callback
    @objc func afAnimate(time: TimeInterval, action: @escaping () -> Void) {
        AFAnimationHelper.animate(view: self.view, time: time, action: action, complete: nil)
    }
    
    /// Method which provide the animate functional.
    /// - Parameters:
    ///   - time: value
    ///   - action: callback
    ///   - complete: callback
    @objc func afAnimate(time: TimeInterval, action: @escaping () -> Void, complete: (() -> Void)?) {
        AFAnimationHelper.animate(view: self.view, time: time, action: action, complete: complete)
    }
    
}
#endif
