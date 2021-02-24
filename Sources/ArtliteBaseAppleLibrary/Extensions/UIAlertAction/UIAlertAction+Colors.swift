//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich on 24.02.2021.
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Set colors.
@objc public extension UIAlertAction {
    
    /// Method which provide to set of the title text color.
    /// - Parameter color: instance.
    func setTitleText(color: UIColor?) {
        guard let color = color else { return }
        self.setValue(color, forKey: "titleTextColor")
    }
    
}
#endif
