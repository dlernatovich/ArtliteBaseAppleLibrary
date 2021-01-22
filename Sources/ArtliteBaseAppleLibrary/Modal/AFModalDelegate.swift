//
//  CFModalDelegate.swift
//  ControlsFramework
//
//  Created by Dmitry Lernatovich 
//

#if os(iOS)
import UIKit

/// Model background type
public enum AFModalType {
    case ligth, dark, system
}

/// Modal protocol delegate
public protocol AFModalProtocolDelegate: AnyObject {
    /// Method which provide the action when the dialog closed
    func onDialogClosed()
}

/// Modal view delegate
public protocol AFModalProtocol: AnyObject {
    
    /// View for the modal
    var modalView: UIView { get }
    
    /// Instance of the {@link CFModelType}
    var type: AFModalType { get }
    
    /// Method which provide the action when the dialog created.
    /// - Parameter dialogType: instance of {@link AFDialogType}
    func onDialogCreated(dialogType: AFDialogType)
    
    /// Init animation finished
    func onInitAnimationFinished()
    
    /// Method which provide the action when the trait collection was changed.
    func onTrainColletionChanged()
    
    /// Method which provide the action when the modal closed
    func onCloseModal()
    
}

// MARK: - Show modal
public extension AFModalProtocol {
    
    /// Method which provide the show view as modal
    func showAsModal(delegate: AFModalProtocolDelegate? = nil, isCancellable: Bool = true) {
        AFModalController.show(view: self, delegate: delegate, isCancellable: isCancellable)
    }
    
    /// Method which provide the show view as modal
    func showAsDialog(delegate: AFModalProtocolDelegate? = nil, isCancellable: Bool = true) {
        AFDialogController.show(view: self, delegate: delegate, isCancellable: isCancellable)
    }
    
    /// Method which provide the close modal
    func dismiss() {
        AFBaseModalController.close()
    }
    
    /// Init animation finished
    func onInitAnimationFinished() { }
    
}
#endif
