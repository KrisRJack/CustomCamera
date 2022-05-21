//
//  Window.swift
//  CameraApp
//
//  Created by Kristopher Jackson on 5/21/22.
//

import UIKit

let window = UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first
