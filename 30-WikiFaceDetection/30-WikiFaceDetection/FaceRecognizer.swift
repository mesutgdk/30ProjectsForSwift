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
    
    class func whosFace (who: String, size: CGSize, completion:(_ image: UIImage?, _ imageFound: Bool)->()) throws{
        
        let escapedString = who.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed)
        
        let pixelsForAPIRequest = Int(max(size.width, size.height))
        
        let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&titles=\(escapedString!)&prop=pageimages&format=json&pithumbsize=\(pixelsForAPIRequest)")
        
        guard let task:URLSessionTask? = URLSession.shared.dataTask(with: url!,completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            if error == nil {
                let wikiDict = try! JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! NSDictionary
                print(wikiDict)
            }
        }) else {
            
        }
        task!.resume()
        
    }
    
}
