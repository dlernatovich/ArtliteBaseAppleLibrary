//
//  DetailsView.swift
//  ExampleApplication
//
//  Created by dlernatovich on 18.01.2021.
//

import Foundation
import UIKit
import ArtliteBaseAppleLibrary

class DetailsView: AFView, AFModalProtocol {
    
    
    
    
    var modalView: UIView { return self.contentView }
    
    var type: AFModalType { return .dark }
    
    func onCloseModal() {
        
    }
    
    func onDialogCreated(dialogType: AFDialogType) {
        
    }
    
    func onTrainColletionChanged() {
    }
    
    
}
