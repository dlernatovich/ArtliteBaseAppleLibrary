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
    
    var view: UIView { return self.contentView }
    
    var type: AFModelType { return .dark }
    
    func onCloseModal() {
        
    }
    
    
}
