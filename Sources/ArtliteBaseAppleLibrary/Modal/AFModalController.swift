//
//  CFModalController.swift
//  ControlsFramework
//
//  Created by Dmitry Lernatovich 
//

#if os(iOS)
import UIKit

/// Controller which provide the modal
class AFModalController: AFBaseModalController {
    
    
    /// Method which provide to show the controller
    /// - Parameters:
    ///   - view: view for displaying
    ///   - delegate: instance of the {@link AFModalProtocolDelegate}
    ///   - isCancellable: set if it cancellable
    class func show(view: AFModalProtocol?, delegate: AFModalProtocolDelegate? = nil, isCancellable: Bool = true) {
        guard let view = view, let controller = AFControllerHelper.getVisibleController() else { return }
        let bundle = Bundle.module
        let modal = AFModalController.init(nibName: "AFModalController", bundle: bundle)
        modal.modalPresentationStyle = .overFullScreen
        modal.modalTransitionStyle = .crossDissolve
        modal.commonView = view
        modal.type = view.type
        modal.commonViewDelegate = delegate
        modal.isCancellable = isCancellable
        modal.dialogType = .modal
        controller.present(modal, animated: true, completion: nil)
    }
    
}
#endif
