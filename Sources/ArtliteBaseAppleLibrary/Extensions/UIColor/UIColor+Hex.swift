//
//  File.swift
//  
//
//  Created by dlernatovich on 03.02.2021.
//

import Foundation
#if os(iOS)
import UIKit

//MARK: - Create color from hex
public extension UIColor {
    
    /// Constructor which provide to create color from hex.
    /// - Parameter hex: {@link String} value of hex.
    convenience init?(hex: String) {
        let r, g, b: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt32 = 0
                if scanner.scanHexInt32(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 16) / 255.0
                    g = CGFloat((hexNumber & 0x00ff0000) >> 8) / 255.0
                    b = CGFloat((hexNumber & 0x0000ff00)) / 255.0
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        return nil
    }
    
}
#endif
