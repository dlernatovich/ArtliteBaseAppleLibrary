//
//  File.swift
//  
//
//  Created by dlernatovich on 12.01.2021.
//

import Foundation


/// Core class for the artlite framework
@objc class AFCore: NSObject {
    
    /// Method which provide the print hello
    @objc static func printHello() {
        NSLog("%@", "Hello AFCore")
    }
    
}
