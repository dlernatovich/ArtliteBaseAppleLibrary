//
//  NSObject+Threads.swift
//  ExampleApplication
//
//  Created by dlernatovich
//

import Foundation
#if os(iOS)
import UIKit

@objc public extension NSObject {
    
    /// Method which provide the action on background
    /// - Parameter action: action vallback
    @objc func afBackgroundThread(action: @escaping () -> Void) {
        AFThreadHelper.background(action: action)
    }
    
    /// Method which provide the action on background
    /// - Parameter action: action vallback
    @objc func afMainThread(action: @escaping () -> Void) {
        AFThreadHelper.main(action: action)
    }
    
    /// Method which provide to execute of task.
    /// - Parameters:
    ///   - action: background task.
    ///   - result: main thread result.
    @objc func afThreadExecute(action: @escaping () -> Void, result: @escaping () -> Void) {
        AFThreadHelper.execute(action: action, result: result)
    }
    
}
#endif
