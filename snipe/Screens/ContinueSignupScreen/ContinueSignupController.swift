//
//  ContinueSignupController.swift
//  snipe
//
//  Created by Madison Weiss on 2/8/25.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import PhotosUI
import AVFoundation
import FirebaseStorage

class ContinueSignupController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let continueSignUpView = ContinueSignupView()
    var pickedImage: UIImage?
    let database = Firestore.firestore()
    let storage = Storage.storage()
    
    override func loadView() {
        view = continueSignUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueSignUpView.profileImage.menu = getMenuImagePicker()
        
        continueSignUpView.continueButton.addTarget(self, action: #selector(continuePressed), for: .touchUpInside)
//        continueSignUpView.profileImage.addTarget(self, action: #selector(selectImageTapped), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func getMenuImagePicker() -> UIMenu {
            let menuItems = [
                        UIAction(title: "Camera",handler: {(_) in
                            self.pickUsingCamera()
                        }),
                        UIAction(title: "Gallery",handler: {(_) in
                            self.pickPhotoFromGallery()
                        })
                    ]
                    
            return UIMenu(title: "Select source", children: menuItems)
        }
        
    func pickUsingCamera() {
            requestCameraAccess { [weak self] isAuthorized in
                guard let self = self else { return }
                
                if isAuthorized {
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    self.present(imagePicker, animated: true)
                } else {
                    showErrorAlert(message: "Camera access is required to capture a profile picture.", controller: self)
                }
            }
        }


        
    func requestCameraAccess(completion: @escaping (Bool) -> Void) {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            switch status {
            case .authorized:
                completion(true) // Already authorized
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    DispatchQueue.main.async {
                        completion(granted)
                    }
                }
            default:
                completion(false) // Access denied or restricted
            }
        }

        
    func pickPhotoFromGallery() {
            requestPhotoLibraryAccess { isAuthorized in
                if isAuthorized {
                    var configuration = PHPickerConfiguration()
                    configuration.filter = .images
                    configuration.selectionLimit = 1
                    let picker = PHPickerViewController(configuration: configuration)
                    picker.delegate = self
                    self.present(picker, animated: true)
                } else {
                    showErrorAlert(message: "Photo library access is required to select a profile picture.", controller: self)
                }
            }
        }

        
    func requestPhotoLibraryAccess(completion: @escaping (Bool) -> Void) {
            let status = PHPhotoLibrary.authorizationStatus()
            
            switch status {
            case .authorized:
                completion(true) // Already authorized
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { newStatus in
                    DispatchQueue.main.async {
                        completion(newStatus == .authorized)
                    }
                }
            default:
                completion(false) // Access denied or restricted
            }
        }

    
    @objc func continuePressed() {
        print("Continue Tapped")
        
        
        // Check each field and add to the emptyFields array if empty
        if continueSignUpView.name.text?.isEmpty ?? true {
            print("")
        }
        else if continueSignUpView.username.text?.isEmpty ?? true {
            print("")
        }
        else if continueSignUpView.bio.text?.isEmpty ?? true {
            print("")
        }
        else {
            uploadToFirestore()
        }
    }
    

}

extension ContinueSignupController: UIPickerViewDelegate, UIPickerViewDataSource, PHPickerViewControllerDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.continueSignUpView.profileImage.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.continueSignUpView.profileImage.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            showErrorAlert(message: "Failed to take photo", controller: self)
        }
    }
}
