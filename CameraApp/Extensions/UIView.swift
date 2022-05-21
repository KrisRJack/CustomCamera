//
//  UIView.swift
//  CameraApp
//
//  Created by Kristopher Jackson on 5/21/22.
//

import UIKit

extension UIView {
    
    static func build<T: UIView>(_ builder: ((T) -> Void)? = nil) -> T {
        let view = T()
        view.translatesAutoresizingMaskIntoConstraints = false
        builder?(view)
        return view
    }
    
    func cornerRadius(_ cornerRadius: CGFloat, corners: [UIRectCorner]? = nil) {
        guard let corners = corners else {
            layer.cornerRadius = cornerRadius
            return
        }
        
        var maskedCorners: CACornerMask = []
        
        for corner in corners {
            switch corner {
            case .topLeft:
                maskedCorners.update(with: .layerMinXMinYCorner)
            case .topRight:
                maskedCorners.update(with: .layerMaxXMinYCorner)
            case .bottomLeft:
                maskedCorners.update(with: .layerMinXMaxYCorner)
            case .bottomRight:
                maskedCorners.update(with: .layerMaxXMaxYCorner)
            default:
                continue
            }
        }
        
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = maskedCorners
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach ({
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        })
    }
    
}
