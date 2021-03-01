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
    @objc public static func background(action: @escaping () -> Void) {
        background(milliseconds: 0 , action: action)
    }
    
    /// Method which provide the action on background
    /// - Parameter action: action vallback
    @objc public static func background(seconds: Int, action: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(seconds)) { action() }
    }
    
    /// Method which provide the action on background
    /// - Parameter action: action vallback
    @objc public static func background(milliseconds: Int, action: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(milliseconds)) { action() }
    }
    
    /// Method which provide the action on main
    /// - Parameter action: action vallback
    @objc public static func main(action: @escaping () -> Void) {
        main(milliseconds: 0, action: action)
    }
    
    /// Method which provide the action on main
    /// - Parameter action: action vallback
    @objc public static func main(seconds: Int, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) { action() }
    }
    
    /// Method which provide the action on main
    /// - Parameter action: action vallback
    @objc public static func main(milliseconds: Int, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(milliseconds)) { action() }
    }
    
    /// Method which provide to execute of task.
    /// - Parameters:
    ///   - action: background task.
    ///   - result: main thread result.
    @objc public static func execute(action: @escaping () -> Void, result: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            action()
            DispatchQueue.main.async {
                result()
            }
        }
    }
    
    
    
}
#endif
