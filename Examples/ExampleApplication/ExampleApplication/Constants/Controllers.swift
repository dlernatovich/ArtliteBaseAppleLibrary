//
//  Controllers.swift
//  ExampleApplication
//
//  Created by dlernatovich on 18.01.2021.
//

import Foundation
import ArtliteBaseAppleLibrary

extension AFDestModel {
    static var home: AFDestModel { AFDestModel(storyboard: "Main", controller: "HomeController") }
    static var details: AFDestModel { AFDestModel(storyboard: "Details", controller: "DetailsController", sufix: "controller1") }
    static var details1: AFDestModel { AFDestModel(storyboard: "Details", controller: "DetailsController", sufix: "controller2") }
    static var details2: AFDestModel { AFDestModel(storyboard: "Details", controller: "DetailsController", sufix: "controller3") }
}
