//
//  Array.swift
//  CameraApp
//
//  Created by Kristopher Jackson on 5/21/22.
//

import UIKit

extension Array where Element == NSLayoutConstraint {
    
    func activate() {
        NSLayoutConstraint.activate(self)
    }
    
    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
    
}
