//
//  SecondView.swift
//  SnapyMenu
//
//  Created by Mesut Gedik on 8.03.2023.
//

import UIKit
import AVFoundation

class SecondView: UIViewController, UIPickerViewDelegate, AVCapturePhotoCaptureDelegate {

    var captureSession : AVCaptureSession!
    var imageOutput  : AVCapturePhotoOutput!
    var previewLayer : AVCaptureVideoPreviewLayer!

    @IBOutlet var cameraView: UIView!
    
    override func viewDidLoad() {
    super.viewDidLoad()

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

       // var error : NSError?
//        var input : AVCaptureDeviceInput!
        imageOutput = AVCapturePhotoOutput()
        
            if let input = try? AVCaptureDeviceInput(device: backCamera){
                if ((captureSession?.canAddInput(input)) != nil) {
                    captureSession!.addInput(input)
                    if (captureSession.canAddOutput(imageOutput)) {
                        captureSession.addOutput(imageOutput)
                        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                        previewLayer.frame = cameraView.bounds
                        cameraView.layer.addSublayer(previewLayer)
                        captureSession.startRunning()
                    }
                }
            }
    }
    @IBOutlet var imageViewTemp: UIImageView!
    
    func didPressTakePhoto (){
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [
            kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
            kCVPixelBufferWidthKey as String: "\(imageViewTemp.frame.width)",
            kCVPixelBufferHeightKey as String: "\(imageViewTemp.frame.height)"] as [String : Any]
        settings.previewPhotoFormat = previewFormat
        imageOutput.capturePhoto(with: settings, delegate: self)
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let imageData = photo.fileDataRepresentation()
        if let data = imageData, let img = UIImage(data: data) {
            print(img.size as Any)
            let dataProvider = CGDataProvider(data: imageData! as CFData)
            let cgImageRef: CGImage! = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: UIImage.Orientation.right)
            
            // imageViewtemp outleti düzenlediğimiz image eşitliyoruz
            imageViewTemp.image = image
            imageViewTemp.isHidden = false
        }
    }
   
    var gotPhoto = Bool()

    func didTakePhoto () {
        if gotPhoto == true {
            imageViewTemp.isHidden = true
            gotPhoto = false
        }
        else {
            captureSession?.startRunning()
            gotPhoto = true
            didPressTakePhoto()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didTakePhoto()
    }
    

}
extension UIInterfaceOrientation {
    var avOrientation: AVCaptureVideoOrientation {
        switch self {
        case UIInterfaceOrientation.landscapeLeft:
            return AVCaptureVideoOrientation.landscapeLeft
        case UIInterfaceOrientation.landscapeRight:
            return AVCaptureVideoOrientation.landscapeRight
        case UIInterfaceOrientation.portraitUpsideDown:
            return AVCaptureVideoOrientation.portraitUpsideDown
        case UIInterfaceOrientation.portrait:
            return AVCaptureVideoOrientation.portrait
        default:
            return AVCaptureVideoOrientation.portrait
        }
    }
    
}
