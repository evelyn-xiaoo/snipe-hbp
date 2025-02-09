//
//  ViewController.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit
import FirebaseAuth
import AVFoundation


class ViewController: UIViewController {

    let cameraView = CameraView()
    
    var captureSession = AVCaptureSession()
    var backfacingCamera: AVCaptureDevice?
    var frontfacingCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var imageOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var image: UIImage?
    
    let firebaseAuth = Auth.auth()
    
    var currentUser: FirestoreUser? = nil
    
    
    
    
    override func loadView() {
        view = cameraView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Task {
            setupCamera()
        }
    }
    
    override func viewDidLoad() {
        
        //setupCamera()
        super.viewDidLoad()
        cameraView.circle.addTarget(self, action: #selector(onCameraButtonClick), for: .touchUpInside)
        cameraView.logOutButton.addTarget(self, action: #selector(onLogoutIconClick), for: .touchUpInside)
        
    }
    
    func setupCamera() {
        
        captureSession.sessionPreset = .photo
        
        let devices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: .video, position: .unspecified).devices
        
        for device in devices {
            if device.position == .back {
                backfacingCamera = device
            } else if device.position == .front {
                frontfacingCamera = device
            }
        }
        
        // default camera
        currentCamera = backfacingCamera
        
        
        do {
            if let currentCamera = currentCamera {
                let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera)
                if captureSession.canAddInput(captureDeviceInput) {
                    captureSession.addInput(captureDeviceInput)
                }
            }
            
        } catch let error {
            print(error)
        }
        
        imageOutput = AVCapturePhotoOutput()
        if let imageOutput = imageOutput {
            if captureSession.canAddOutput(imageOutput) {
                captureSession.addOutput(imageOutput)
            }
        }

        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        if let previewLayer = previewLayer {
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.cornerRadius = cameraView.cameraBox.layer.cornerRadius
            previewLayer.frame = cameraView.cameraBox.layer.bounds
            cameraView.cameraBox.layer.addSublayer(previewLayer)
        }
        

        // Start the session
        captureSession.startRunning()
    }
    
    @objc func onLogoutIconClick(){
        logoutCurrentAccount()
    }
    
    func showErrorAlert(message: String){
            let alert = UIAlertController(title: "Error", message: "\(message) Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
    }
    

    //
    @objc func onCameraButtonClick() {
        let settings = AVCapturePhotoSettings()
            settings.flashMode = .auto
            imageOutput?.capturePhoto(with: settings, delegate: self)
    }

}

extension ViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation(),
              let image = UIImage(data: imageData) else {
            print("Error capturing image: \(String(describing: error))")
            return
        }
        
        self.image = image
        showCapturedImage(image)
    }
    
    func showCapturedImage(_ image: UIImage) {
        let selectPerson = PersonViewController()
        selectPerson.picture = image
        selectPerson.modalPresentationStyle = .fullScreen
        self.present(selectPerson, animated: true)
        
        /*
        let imageView = UIImageView(image: image)
        imageView.frame = cameraView.cameraBox.bounds
        imageView.contentMode = .scaleAspectFill
        
        imageView.backgroundColor = .black
        imageView.isUserInteractionEnabled = true
        
        // Add a tap gesture to dismiss preview
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPreview(_:)))
        imageView.addGestureRecognizer(tapGesture)
        
        
        cameraView.cameraBox.addSubview(imageView)
        */
    }

    @objc func dismissPreview(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }

}


