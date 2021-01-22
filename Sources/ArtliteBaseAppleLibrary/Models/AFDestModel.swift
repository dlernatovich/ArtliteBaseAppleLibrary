//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Destination model.
@objc public class AFDestModel: NSObject {
    
    /// Name of the storyboard.
    internal let storyboard: String
    
    /// Name of the storyboard.
    internal let controller: String
    
    /// Sufix for the additional compare
    internal let sufix: String?
    
    /// Default constructor.
    /// - Parameters:
    ///   - storyboard: storyboard value
    ///   - controller: controller value
    public convenience init(storyboard: String, controller: String) {
        self.init(storyboard: storyboard, controller: controller, sufix: nil)
    }
    
    /// Default constructor.
    /// - Parameters:
    ///   - storyboard: storyboard value
    ///   - controller: controller value
    public init(storyboard: String, controller: String, sufix: String?) {
        self.storyboard = storyboard
        self.controller = controller
        self.sufix = sufix
    }
    
    
    /// Equal functional method.
    /// - Parameter object: with equal
    /// - Returns: equals result
    public override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? AFDestModel else { return false }
        if let sufix1 = self.sufix {
            if let sufix2 = other.sufix {
                return (self.storyboard == other.storyboard) && (self.controller == other.controller) && (sufix1 == sufix2)
            }
            return false
        }
        return (self.storyboard == other.storyboard) && (self.controller == other.controller)
    }
    
}

// MARK: - Constants
@objc extension AFDestModel {
    
    /// Instance of the {@link AFDestination}
    internal static var none: AFDestModel { return AFDestModel(
        storyboard: "LRt9WWzUDFQzrwqu9ozdVmmJSE5QoZJx3AW9NQSi",
        controller: "2XGM9viuyyh33XcersAdLXqc2HsXRtdB3EAgkrjC"
    ) }
    
}

#endif
