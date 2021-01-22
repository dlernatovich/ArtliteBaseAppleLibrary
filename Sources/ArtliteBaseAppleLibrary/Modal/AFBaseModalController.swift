//
//  CFBaseModalController.swift
//  ControlsFramework
//
//  Created by Dmitry Lernatovich
// NEW VERSION
//

#if os(iOS)
import UIKit

/// Close notification notification
private extension AFNotificationModel {
    static var closeModal: AFNotificationModel { AFNotificationModel(name: "VBDszAfr6aeCQ5t7cpYrruyJipJMtSnWxgkdZVAm") }
}

/// Base modal type
@objc public enum AFDialogType: Int {
    case dialog = 1
    case modal = 2
}

@objc class AFBaseModalController: UIViewController {

    /// Defaults
    fileprivate enum Defaults {
        static let blurAlpha: CGFloat = 0.9
    }
    
    ///Blur type
    var type: AFModalType = .ligth {
        didSet { self.onInitBlurView() }
    }
    
    /// Instance of the {@link DispatchGroup}
    lazy var queue: DispatchGroup = { return DispatchGroup() }()
    
    /// View instance
    @IBOutlet private weak var viewStack: UIStackView!
    /// View instance
    @IBOutlet private weak var constHeight: NSLayoutConstraint!
    
    /// Instance of the {@link UIView}
    open var commonView: AFModalProtocol?
    
    /// Instance of the {@link CFModalProtocolDelegate}
    open var commonViewDelegate: AFModalProtocolDelegate?

    /// Check if the dialog is cancellable
    open var isCancellable: Bool = true
    
    /// Instance of the {@link AFDialogType}
    internal var dialogType: AFDialogType = .dialog {
        didSet {
            self.commonView?.onDialogCreated(dialogType: self.dialogType)
        }
    }
    
    /// Method which provide the create controller with codder
    /// - Parameter coder: instance of the {@link NSCoder}
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    /// Method which provide to create controller from nib name and bundle
    /// - Parameters:
    ///   - nibNameOrNil: nib name
    ///   - nibBundleOrNil: bundle name
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    /// Dealloc method
    deinit {
        self.afNotificationUnsubscribe()
        #if DEBUG
        print("AFBaseModalController is deinit")
        #endif
    }
    
    /// Method which provide the action when controller created
    override func viewDidLoad() {
        super.viewDidLoad()
        self.afPlayHaptic()
        self.afKeyboardHide()
        self.afNotificationSubscribe(owner: self, notification: .closeModal, selector: #selector(closeController))
    }
    
    /// Method which provide the view did appear functional
    /// - Parameter animated: if it animated
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.onInitModalView()
    }
    
    /// Method which provide the init of the shadow view
    fileprivate func onInitBlurView() {
        var blur: UIBlurEffect? = nil;
        switch self.type {
        case .ligth: blur = UIBlurEffect.init(style: .light)
        case .dark: blur = UIBlurEffect.init(style: .dark)
        case .system:
            if #available(iOS 13.0, *) {
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    blur = UIBlurEffect.init(style: .dark)
                } else {
                    blur = UIBlurEffect.init(style: .light)
                }
            } else {
                blur = UIBlurEffect.init(style: .light)
            }
        }
        let visualEffect = UIVisualEffectView.init(effect: blur!)
        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        visualEffect.alpha = Defaults.blurAlpha
        visualEffect.isUserInteractionEnabled = true
        visualEffect.addTap(target: self, selector: #selector(closeControllerIfNeeded))
        let left = NSLayoutConstraint.init(item: visualEffect, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint.init(item: visualEffect, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint.init(item: visualEffect, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint.init(item: visualEffect, attribute: .bottomMargin, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1.0, constant: 0)
        self.view.insertSubview(visualEffect, at: 0)
        self.view.addConstraints([left, right, top, bottom])
    }
    
    /// Method which provide the init of the modal view
    fileprivate func onInitModalView() {
        guard let view = self.commonView?.modalView else { return }
        self.viewStack.addArrangedSubview(view)
        self.afAnimate(time: 0.2) {
            self.constHeight.priority = UILayoutPriority.init(rawValue: 300)
        } complete: {
            self.commonView?.onInitAnimationFinished()
        }
    }
    
    /// Method which provide the close of the controller
    @objc fileprivate func closeController() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.constHeight.priority = UILayoutPriority.init(rawValue: 999)
            self.view.layoutIfNeeded()
        }) { (success) in
            self.dismiss(animated: true) {
                self.commonView?.onCloseModal()
                self.commonViewDelegate?.onDialogClosed()
                self.commonView = nil;
                self.commonViewDelegate = nil;
            };
        }
    }
    
    /// Method which provide the close controller if needed (close only if is cancellable == true)
    @objc private func closeControllerIfNeeded() {
        if (isCancellable == true) { self.closeController() }
    }
    
    /// Method which provide the action when the color was changed.
    /// - Parameter previousTraitCollection: instance of the {@link UITraitCollection}
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.commonView?.onTrainColletionChanged()
    }
    
    /// Method which provide the close controller
    class func close() {
        AFNotificationHelper.send(notification: .closeModal, info: nil)
    }

}
#endif
