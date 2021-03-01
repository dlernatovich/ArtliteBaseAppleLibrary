//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Notification heler
@objc public class AFNotificationHelper: NSObject {
    
    /// Method which provide the sending of the notification.
    /// - Parameters:
    ///   - notification: type.
    ///   - info: information to send.
    @objc public static func send(notification: AFNotificationModel, info: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: notification.name.afNotification, object: nil, userInfo: info)
    }
    
    /// Method which provide subscribe for notification.
    /// - Parameters:
    ///   - owner: owner model.
    ///   - notification: notification type.
    ///   - selector: instance.
    @objc public static func subscribe(owner: Any, notification: AFNotificationModel, selector: Selector){
        NotificationCenter.default.addObserver(
            owner,
            selector: selector,
            name: notification.name.afNotification,
            object: nil
        )
    }
    
    /// Unsubscribe from notification.
    @objc public static func unsubscribe(owner: Any) {
        NotificationCenter.default.removeObserver(owner)
    }
    
}
#endif
