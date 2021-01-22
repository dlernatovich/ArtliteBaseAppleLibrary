//
//  AFThreadHelper.swift
//  ExampleApplication
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Thread helper
@objc public class AFThreadHelper: NSObject {
    
    /// Method which provide the action on background
    /// - Parameter action: action vallback
    @objc static func background(action: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            action()
        }
    }
    
    /// Method which provide the action on background
    /// - Parameter action: action vallback
    @objc static func main(action: @escaping () -> Void) {
        DispatchQueue.main.async {
            action()
        }
    }
    
    /// Method which provide to execute of task.
    /// - Parameters:
    ///   - action: background task.
    ///   - result: main thread result.
    @objc static func execute(action: @escaping () -> Void, result: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            action()
            DispatchQueue.main.async {
                result()
            }
        }
    }
    
    
    
}
#endif
