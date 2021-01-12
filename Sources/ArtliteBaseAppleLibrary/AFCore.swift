//
//  File.swift
//  
//
//  Created by dlernatovich on 12.01.2021.
//

import Foundation


/// Core class for the artlite framework
@objc public class AFCore: NSObject {
    
    /// Method which provide the print hello
    @objc public static func printHello() {
        NSLog("%@", "Hello AFCore")
    }
    
}
