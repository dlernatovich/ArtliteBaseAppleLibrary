//
//  DetailsController.swift
//  ExampleApplication
//
//  Created by dlernatovich on 18.01.2021.
//

import Foundation
import UIKit
import ArtliteBaseAppleLibrary

/// Details controller
class DetailsController: AFController {
    
    /// Details controller
    override func viewDidLoad() {
        super.viewDidLoad()
        switch self.type {
        case .details:
            self.afShow(from: .details1)
            break
        case .details1:
            self.afShow(from: .details2)
            break
        case .details2:
            self.afRemove(controllers: [.details, .details1])
            break
        default:
            break
        }
    }
    
    @IBAction func onHomeBackPressed(_ sender: UIButton) {
        self.afBack(to: .home)
    }
    
}
