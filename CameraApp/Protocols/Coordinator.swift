//
//  Coordinator.swift
//  CameraApp
//
//  Created by Kristopher Jackson on 5/21/22.
//

import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get }
    init(_ navigationController: UINavigationController)
    func start()
}
