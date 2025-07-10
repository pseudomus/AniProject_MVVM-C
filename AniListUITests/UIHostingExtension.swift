//
//  UIHostingExtension.swift
//  AniListUITests
//
//  Created by Luca Lacerda on 13/06/25.
//

import SwiftUI
import UIKit

extension View {
    var asViewController: UIViewController {
        UIHostingController(rootView: self)
    }
}
