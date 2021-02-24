//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich on 24.02.2021.
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Show functional.
@objc extension UIAlertController {
    
    /// Method which provide to show functional.
    func show() { AFControllerHelper.getVisibleController()?.present(self, animated: true) }
    
}
#endif
