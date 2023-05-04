//
//  FaceRecognizer.swift
//  30-WikiFaceDetection
//
//  Created by Mesut Gedik on 3.05.2023.
//

import UIKit
import ImageIO

class FaceRecognizer: NSObject {

    enum FaceRecognizerError: Error{
        case CantDownloadImage
    }
    
    class func whosFace (who: String, size: CGSize, completion: @escaping ( _ image: UIImage?, _ imageFound: Bool)->()) throws{
        
        let escapedString = who.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed)
        
        let pixelsForAPIRequest = Int(max(size.width, size.height))
        
        let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&titles=\(escapedString!)&prop=pageimages&format=json&pithumbsize=\(pixelsForAPIRequest)")
        
        guard let task:URLSessionTask? = URLSession.shared.dataTask(with: url!,completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            if error == nil {
                let wikiDict = try! JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! NSDictionary
//                print(wikiDict)
                if let query = wikiDict.object(forKey: "query") as? NSDictionary {
                    if let pages = query.object(forKey: "pages") as? NSDictionary {
                        if let pageContent = pages.allValues.first as? NSDictionary {
                            if let thumbnail = pageContent.object(forKey: "thumbnail") as? NSDictionary {
                                if let thumbURL = thumbnail.object(forKey: "source") as? String {
                                    let faceImage = UIImage(data: try! Data(contentsOf: URL(string: thumbURL)!))
                                    completion(faceImage,true)
                                } else{
                                    completion(nil,false)
                                }
                            }
                        }
                    }
                }
            }
        }) else {
            throw FaceRecognizerError.CantDownloadImage
        }
        task!.resume()
        
    }
    
    class func centerTheFaceOnImage(imageView: UIImageView) {
        let context = CIContext(options: nil)
        let options = [CIDetectorAccuracy:CIDetectorAccuracyHigh]
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: options)!
        
        let faceImage = imageView.image
        let ciImage = CIImage(cgImage: faceImage!.cgImage!)
        
        let features = detector.features(in: ciImage)
        
        if features.count > 0 {
            var face: CIFaceFeature!
            
            for rect in features{
                face = (rect as! CIFaceFeature)
            }
            var faceRectWithExtendedBounds = face.bounds
            faceRectWithExtendedBounds.origin.x -= 20
            faceRectWithExtendedBounds.origin.y -= 30
            
            faceRectWithExtendedBounds.size.width += 40
            faceRectWithExtendedBounds.size.height += 60
            
            let x = faceRectWithExtendedBounds.origin.x / faceImage!.size.width
            let y = (faceImage!.size.height - faceRectWithExtendedBounds.origin.y - faceRectWithExtendedBounds.size.height) / faceImage!.size.height
            let withFace = faceRectWithExtendedBounds.size.width / faceImage!.size.width
            let heightface = faceRectWithExtendedBounds.size.height / faceImage!.size.height
            
            imageView.layer.contentsRect = CGRect(x: x, y: y, width: withFace, height: heightface)
        }
//        print( "it is done")
    }
    
}
