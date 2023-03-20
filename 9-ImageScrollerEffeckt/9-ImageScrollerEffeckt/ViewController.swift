//
//  ViewController.swift
//  9-ImageScrollerEffeckt
//
//  Created by Mesut Gedik on 20.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imageView = UIImageView(image: UIImage(named: "galataTower"))
        setUpScrollView()
        
        scrollView.delegate = self

        setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        recenterImage()
    }
    func setUpScrollView () {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = imageView.frame.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
    }
    func setZoomScaleFor(scrollViewSize: CGSize){
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        
        // zooming properties
        //let minScale = scrollView.frame.size.width / imageView.frame.size.width
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 6.0
        scrollView.zoomScale = 1.0
        
    }
    func recenterImage (){
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizantalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizantalSpace, bottom: verticalSpace, right: horizantalSpace)
    }
}
extension ViewController: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        recenterImage()
    }
    
}

