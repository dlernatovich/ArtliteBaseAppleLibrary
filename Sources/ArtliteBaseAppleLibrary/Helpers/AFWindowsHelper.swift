//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Windows helper
@objc public class AFWindowsHelper: NSObject {
    
    /// Method which provide the getting of the key window
    /// - Returns: instance of the {@link UIWindow}
    @objc static func getKeyWindow() -> UIWindow? { return UIApplication.shared.windows.first(where: {$0.isKeyWindow}) }
    
}
#endif
