//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Key window
@objc public extension NSObject {
    
    /// Global key window
    @objc class var afGlobalKeyWindow: UIWindow? { return AFWindowsHelper.getKeyWindow() }
    
    /// Instance of the {@link UIWindow}
    @objc var afKeyWindow: UIWindow? { return AFWindowsHelper.getKeyWindow() }
    
    /// Check if the theme is daek
    @objc class var afGlobalIsDark: Bool {
        if #available(iOS 13.0, *) {
            return UITraitCollection.current.userInterfaceStyle == .dark
        }
        return false
    }
    
    /// Check if the theme is daek
    @objc var afIsDark: Bool { NSObject.afGlobalIsDark }
    
    /// Check if current device is iPad
    @objc class var afGlobalIsIpad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
    
    /// Check if current device is iPad
    @objc var afIsIpad: Bool { NSObject.afGlobalIsIpad }
    
    /// Bottom safe area value for iPhone X like devices
    @objc class var afGlobalSafeBottom: CGFloat { afGlobalKeyWindow?.safeAreaInsets.bottom ?? 0.0 }
    
    /// Bottom safe area value for iPhone X like devices
    @objc var afSafeBottom: CGFloat { NSObject.afGlobalSafeBottom }
    
}

// MARK: - Animation
@objc public extension NSObject {
    
    /// Method which provide the animation functional
    /// - Parameters:
    ///   - view: instance
    ///   - time: value
    ///   - action: callback
    @objc func afAnimate(view: UIView?, time: TimeInterval, action: @escaping () -> Void) {
        AFAnimationHelper.animate(view: view, time: time, action: action)
    }
    
    /// Method which provide the animation functional
    /// - Parameters:
    ///   - view: instance
    ///   - time: value
    ///   - action: callback
    @objc func afAnimate(view: UIView?, time: TimeInterval, action: @escaping () -> Void, complete: (() -> Void)?) {
        AFAnimationHelper.animate(view: view, time: time, action: action, complete: complete)
    }
    
}

#endif
