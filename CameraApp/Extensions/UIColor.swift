//
//  UIColor.swift
//  CameraApp
//
//  Created by Kristopher Jackson on 5/21/22.
//

import UIKit

extension UIColor {
    
    static var cameraThemeColor: UIColor {
        get {
            return UIColor(rgb: 0xEF4456)
        }
    }
    
    static var cameraSecondaryThemeColor: UIColor {
        get {
            return .white
        }
    }
    
    static var cameraTintColor: UIColor {
        get {
            return .white
        }
    }
    
    // MARK: - init(rgb: )
    
    public convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8)  / 255.0,
            blue: CGFloat((rgb & 0x0000FF) >> 0)  / 255.0,
            alpha: 1
        )
    }
    
    // MARK: - init(rgba: )
    
    public convenience init(rgba: UInt64) {
        self.init(
            red: CGFloat((rgba & 0xFF000000) >> 24) / 255.0,
            green: CGFloat((rgba & 0x00FF0000) >> 16)  / 255.0,
            blue: CGFloat((rgba & 0x0000FF00) >> 8)  / 255.0,
            alpha: CGFloat((rgba & 0x000000FF) >> 0) / 255.0
        )
    }
    
    // MARK: - init(colorString: )
    
    public convenience init(colorString: String) {
        var colorInt: UInt64 = 0
        Scanner(string: colorString).scanHexInt64(&colorInt)
        self.init(rgb: (Int) (colorInt))
    }
    
}
