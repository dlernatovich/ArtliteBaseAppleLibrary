//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit


/// Display type
@objc public enum AFDisplayType: Int {
    case normal = 0x00000001
    case details = 0x00000002
}

/// Controller for the objective C
@objc open class AFControllerObjc: UIViewController {
    public var type: AFDestModel = .none
    public internal(set) var displayType: AFDisplayType = .normal
}

/// Controller for swift
open class AFController: UIViewController {
    public var type: AFDestModel = .none
    public internal(set) var displayType: AFDisplayType = .normal
}
#endif
