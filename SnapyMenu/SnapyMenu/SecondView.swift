//
//  SecondView.swift
//  SnapyMenu
//
//  Created by Mesut Gedik on 8.03.2023.
//

import UIKit
import AVFoundation

class SecondView: UIViewController, UIPickerViewDelegate, UINavigationControllerDelegate {

    var captureSession : AVCaptureSession?
    var stillImageOutput  : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?

    @IBOutlet var cameraView: UIView!
    
    override func viewDidLoad() {
    super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        captureSession = AVCaptureSession ()

        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080

        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)!

        var error : NSError?
        var input : AVCaptureDeviceInput!

        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
 
        if (error == nil && ((captureSession?.canAddInput(input)) != nil) ) {
            captureSession?.addInput(input)

            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecType.jpeg]

            if let stillImageOutputTemp = stillImageOutput {
                if captureSession?.canAddOutput(stillImageOutputTemp) != nil {
                    captureSession?.addOutput(stillImageOutputTemp)
                    if let captureSessionTemp = captureSession {
                        previewLayer = AVCaptureVideoPreviewLayer(session: captureSessionTemp)
                        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
                        previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                        cameraView.layer.addSublayer(previewLayer!)
                        captureSession?.startRunning()
                    }
                }
            }
        }
    }


}

