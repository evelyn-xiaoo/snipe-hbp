//
//  CameraFunctionsController.swift
//  snipe
//
//  Created by Madison Weiss on 2/9/25.
//

import UIKit
import AVFoundation
import Photos
import FirebaseStorage // or your database service
import FirebaseFirestore
import PhotosUI

// MARK: - Image Picker Functions
class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    static let shared = ImagePickerManager()
    
    var pickedImage: UIImage?
    var imageUploadCompletion: ((String?) -> Void)?
    
    // Menu to select image source
    func getMenuImagePicker(controller: UIViewController) -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera", handler: { _ in
                self.pickUsingCamera(presentingViewController: controller)
            }),
            UIAction(title: "Gallery", handler: { _ in
                self.pickPhotoFromGallery(presentingViewController: controller)
            })
        ]
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    // Camera Picker
    func pickUsingCamera(presentingViewController: UIViewController) {
        requestCameraAccess { [weak self] isAuthorized in
            guard let self = self else { return }
            
            if isAuthorized {
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                presentingViewController.present(imagePicker, animated: true)
            } else {
                self.showErrorAlert(message: "Camera access is required.", controller: presentingViewController)
            }
        }
    }
    
    // Photo Library Picker
    func pickPhotoFromGallery(presentingViewController: UIViewController) {
        requestPhotoLibraryAccess { [weak self] isAuthorized in
            guard let self = self else { return }
            
            if isAuthorized {
                var configuration = PHPickerConfiguration()
                configuration.filter = .images
                configuration.selectionLimit = 1
                let picker = PHPickerViewController(configuration: configuration)
                picker.delegate = self
                presentingViewController.present(picker, animated: true)
            } else {
                self.showErrorAlert(message: "Photo library access is required.", controller: presentingViewController)
            }
        }
    }
    
    // Request camera access
    func requestCameraAccess(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            completion(true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        default:
            completion(false)
        }
    }
    
    // Request photo library access
    func requestPhotoLibraryAccess(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            completion(true)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                DispatchQueue.main.async {
                    completion(newStatus == .authorized)
                }
            }
        default:
            completion(false)
        }
    }
    
    // Image Picker Delegate - Gallery
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProviders = results.map { $0.itemProvider }
        
        for item in itemProviders {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    DispatchQueue.main.async {
                        if let image = image as? UIImage {
                            self?.pickedImage = image
                            self?.uploadImageToDatabase(image: image) {
                                urlString in if let urlString = urlString {
                                    self?.imageUploadCompletion?(urlString)
                                    print("Image uploaded successfully: \(urlString)")
                                } else {
                                    print("Image upload failed.")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Image Picker Delegate - Camera
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage {
            self.pickedImage = image
            self.imageUploadCompletion?(nil)
        } else {
            print("Failed to capture image")
        }
    }
    
    // Show error alert
    func showErrorAlert(message: String, controller: UIViewController) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        controller.present(alert, animated: true)
    }
}

// MARK: - Image Upload Functions
extension ImagePickerManager {
    
    // Upload image to Firebase Storage (or other backend)
    func uploadImageToDatabase(image: UIImage, completion: @escaping (String?) -> Void) {
        // Convert image to data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(nil)
            return
        }
        
        // Create a reference to Firebase Storage (or other service)
        let storageRef = Storage.storage().reference().child("images/\(UUID().uuidString).jpg")
        
        // Upload image data
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Get the download URL
            storageRef.downloadURL { (url, error) in
                if let url = url {
                    completion(url.absoluteString) // Return the URL of the uploaded image
                } else {
                    print("Error getting download URL: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                }
            }
        }
    }
    
    // Retrieve image from database using URL (Firebase example)
    func retrieveImageFromDatabase(imageURL: String, completion: @escaping (UIImage?) -> Void) {
        let storageRef = Storage.storage().reference(forURL: imageURL)
        
        storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error retrieving image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
}

