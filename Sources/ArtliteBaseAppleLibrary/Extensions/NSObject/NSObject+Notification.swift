//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Notitifications
@objc public extension NSObject {
    
    /// Method which provide the sending of the notification.
    /// - Parameters:
    ///   - notification: type.
    ///   - info: information to send.
    @objc func afNotificationSend(notification: AFNotificationModel, info: [AnyHashable: Any]?) {
        AFNotificationHelper.send(notification: notification, info: info)
    }
    
    /// Method which provide subscribe for notification.
    /// - Parameters:
    ///   - notification: notification type.
    ///   - selector: instance.
    @objc func afNotificationSubscribe(notification: AFNotificationModel, selector: Selector){
        AFNotificationHelper.subscribe(owner: self, notification: notification, selector: selector)
    }
    
    /// Method which provide subscribe for notification.
    /// - Parameters:
    ///   - owner: owner model.
    ///   - notification: notification type.
    ///   - selector: instance.
    @objc func afNotificationSubscribe(owner: Any, notification: AFNotificationModel, selector: Selector){
        AFNotificationHelper.subscribe(owner: owner, notification: notification, selector: selector)
    }
    
    /// Unsubscribe from notification.
    @objc func afNotificationUnsubscribe() {
        AFNotificationHelper.unsubscribe(owner: self)
    }
    
}

#endif
