//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Animation helper
@objc class AFAnimationHelper: NSObject {
    
    /// Method which provide the animation functional
    /// - Parameters:
    ///   - view: instance
    ///   - time: value
    ///   - action: callback
    @objc static func animate(view: UIView?, time: TimeInterval, action: @escaping () -> Void) {
        animate(view: view, time: time, action: action, complete: nil)
    }
    
    /// Method which provide the animation functional
    /// - Parameters:
    ///   - view: instance
    ///   - time: value
    ///   - action: callback
    @objc static func animate(view: UIView?, time: TimeInterval, action: @escaping () -> Void, complete: (() -> Void)?) {
        view?.layoutIfNeeded()
        UIView.animate(withDuration: time) {
            action()
            view?.layoutIfNeeded()
        } completion: { (result) in
            complete?()
        }

    }
    
}
#endif
