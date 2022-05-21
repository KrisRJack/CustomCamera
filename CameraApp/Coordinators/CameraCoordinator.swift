//
//  CameraCoordinator.swift
//  CameraApp
//
//  Created by Kristopher Jackson on 5/21/22.
//

import UIKit
import PhotosUI

final class CameraCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController?.delegate = self
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func start() {
        let cameraViewController = CameraViewController()
        cameraViewController.navigationDelegate = self
        navigationController?.viewControllers = [cameraViewController]
    }
    
    private func displayError(withMessage message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Done", style: .default))
        navigationController?.present(alertController, animated: true)
    }
    
}

extension CameraCoordinator: CameraNavigationDelegate {
    
    func showPermissionMessage(from viewController: CameraViewController) {
        let title = NSLocalizedString("CAMERA_DISABLED_HEADER", comment: "Header")
        let message = NSLocalizedString("CAMERA_DISABLED_TEXT", comment: "General")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let settingsActionTitle = NSLocalizedString("GO_TO_SETTING_BUTTON", comment: "Button")
        let settingsAction = UIAlertAction(title: settingsActionTitle, style: .default, handler: { action in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:]) { _ in
                self.start() // TODO: Replace with dismiss if presented as modal. Restarting guarentees that permission is requested again.
            }
         })
            
        alertController.addAction(settingsAction)
        navigationController?.present(alertController, animated: true)
    }
    
    func presentError(from viewController: CameraViewController, withMessage message: String) {
        displayError(withMessage: message)
    }
    
    func dismiss(from viewController: CameraViewController) {
        navigationController?.dismiss(animated: true)
    }
    
    func showImagePreview(from viewController: CameraViewController, imageData: Data) {
        let imagePreviewController = ImagePreviewViewController(imageData: imageData)
        imagePreviewController.modalTransitionStyle = .crossDissolve
        imagePreviewController.modalPresentationStyle = .fullScreen
        imagePreviewController.delegate = viewController
        imagePreviewController.navigationDelegate = self
        navigationController?.present(imagePreviewController, animated: true)
    }
    
    func goToPhotoLibrary(from viewController: CameraViewController, with configuration: PHPickerConfiguration) {
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = viewController
        pickerViewController.modalPresentationStyle = .fullScreen
        navigationController?.present(pickerViewController, animated: true, completion: nil)
    }
    
    func doSomethingWithPhotos(from viewController: CameraViewController, with photos: [Data]) {
        
        // TODO: IMPLEMENT ME!
        
        let alertController = UIAlertController(title: "Hooray! \(photos.count) photos have been captured! Now do something with them!", message: nil, preferredStyle: .alert)
        navigationController?.present(alertController, animated: true)
    }
    
}

extension CameraCoordinator: ImagePreviewNavigationDelegate {
    
    func dismiss(from viewController: ImagePreviewViewController) {
        navigationController?.dismiss(animated: true)
    }
    
}

extension CameraCoordinator: UINavigationControllerDelegate {
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        .portrait
    }
    
}
