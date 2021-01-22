//
//  ViewController.swift
//  ExampleApplication
//
//  Created by dlernatovich on 18.01.2021.
//

import UIKit
import ArtliteBaseAppleLibrary

class ViewController: AFController, AFModalProtocolDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.type = .home
        // Do any additional setup after loading the view.
    }

    @IBAction func onShowController(_ sender: UIButton) {
//        self.afShow(from: .details)
        DetailsView().showAsModal(delegate: self, isCancellable: true)
    }
    
    @IBAction func onShowDetailsController(_ sender: UIButton) {
        self.afShow(detailsFrom: .details)
    }
    
    func onDialogClosed() {
        NSLog("DIALOG CLOSED")
    }

}

