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
    
}
