//
//  NSObject+Haptic.swift
//  ExampleApplication
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Haptic type
@objc public enum AFHapticType: Int {
    case standart = 0x00000001
    case error = 0x00000002
    case success = 0x00000003
    case warning = 0x00000004
}

@objc public extension NSObject {
    
    /// Method which provide the play haptic feedback
    /// - Parameter type: Haptic type
    @objc static func afPlayHaptic() {
        afPlayHaptic(type: .standart)
    }
    
    /// Method which provide the play haptic feedback
    /// - Parameter type: Haptic type
    @objc static func afPlayHaptic(type: AFHapticType) {
        // Added haptic feedback
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light);
        let notificationGenerator = UINotificationFeedbackGenerator();
        impactFeedbackgenerator.prepare();
        switch type {
        case .standart:
            impactFeedbackgenerator.impactOccurred();
        case .error:
            notificationGenerator.notificationOccurred(.error);
        case .success:
            notificationGenerator.notificationOccurred(.success);
        case .warning:
            notificationGenerator.notificationOccurred(.warning);
        }
    }
    
    /// Method which provide the play haptic feedback
    /// - Parameter type: Haptic type
    @objc func afPlayHaptic() {
        NSObject.afPlayHaptic()
    }
    
    /// Method which provide the play haptic feedback
    /// - Parameter type: Haptic type
    @objc func afPlayHaptic(type: AFHapticType) {
        NSObject.afPlayHaptic(type: type)
    }
    
}
#endif
