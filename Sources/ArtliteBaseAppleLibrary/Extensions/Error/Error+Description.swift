//
//  File.swift
//  
//
//  Created by dlernatovich
//

import Foundation
#if os(iOS)
import UIKit

//MARK: - Description for the Objective C
@objc public extension NSError {
    
    /// {@link String} value of the description
    @objc var afDescription: String { return self.description }
    
    /// {@link String} value of the localized description
    @objc var afLocalizedDescription: String { return NSLocalizedString(self.afDescription, comment: "") }
    
}

//MARK: - Description for Swift
public extension Error {
    
    /// {@link String} value of the description
    var afDescription: String { return String(format: "%@", self.localizedDescription)  }
    
    /// {@link String} value of the localized description
    var afLocalizedDescription: String { return NSLocalizedString(self.afDescription, comment: "") }
    
}
#endif
