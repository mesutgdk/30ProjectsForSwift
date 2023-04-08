//
//  ViewController.swift
//  19-PullToRef
//
//  Created by Mesut Gedik on 6.04.2023.
//

import UIKit

class RefreshViewController: UITableViewController{
    
    
    var labelView : UIView!
    
    var labelArray : Array<UILabel> = []
    
    var isAnimating = false
    
    var currentColorIndex = 0
    
    var currentLabelIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.clear
        refreshControl?.tintColor = UIColor.clear
        tableView.addSubview(refreshControl!)

        loadRefreshContents()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return M.whatIDid.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: M.reusableCell, for: indexPath)
        cell.textLabel?.text = M.whatIDid[indexPath.row]

        return cell
    }
   
    func loadRefreshContents() {
        let refreshContents = Bundle.main.loadNibNamed(M.refreshView, owner: self)
        labelView = refreshContents![0] as? UIView
        labelView.frame = refreshControl!.bounds
//        print(labelView.subviews.count)
    
//        for i in 0..<labelView.subviews.count {
//            if let item = labelView.viewWithTag(i + 1) {
//                labelArray.append(item as! UILabel)
//            }
//        }
//        print(labelArray.count)
        refreshControl!.addSubview(labelView)
    }
    
    func animateStep1 (){
        isAnimating = true
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn) { [self] in
            labelView.subviews[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/3))
//         renk değiştirme eklenecek

        }
        completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
                self.labelView.subviews[self.currentLabelIndex].transform = .identity
            } completion: { _ in
                self.currentLabelIndex += 1
                if self.currentLabelIndex < self.labelView.subviews.count {
                    self.animateStep1()
                }else {
                    print("cycle is done")
                    self.animateStep2()
                }
            }

        }
    }
    func animateStep2(){
        UIView.animate(withDuration: 0.6, delay: 0) {
            let scale1 = CGAffineTransform(scaleX: 1.5, y: 1.5)
            let scale2 = CGAffineTransform(scaleX: 1.7, y: 1.7)
            self.labelView.subviews[0].transform = scale2
            self.labelView.subviews[1].transform = scale1
            self.labelView.subviews[2].transform = scale1
            self.labelView.subviews[3].transform = scale1
            self.labelView.subviews[4].transform = scale1
            self.labelView.subviews[5].transform = scale1
            self.labelView.subviews[6].transform = scale1
            self.labelView.subviews[7].transform = scale1
            self.labelView.subviews[8].transform = scale1
            self.labelView.subviews[9].transform = scale1
            self.labelView.subviews[10].transform = scale1
            self.labelView.subviews[11].transform = scale1
            self.labelView.subviews[12].transform = scale2
            
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0,options: .curveEaseOut) {
                
                self.labelView.subviews[0].transform = .identity
                self.labelView.subviews[1].transform = .identity
                self.labelView.subviews[2].transform = .identity
                self.labelView.subviews[3].transform = .identity
                self.labelView.subviews[4].transform = .identity
                self.labelView.subviews[5].transform = .identity
                self.labelView.subviews[6].transform = .identity
                self.labelView.subviews[7].transform = .identity
                self.labelView.subviews[8].transform = .identity
                self.labelView.subviews[9].transform = .identity
                self.labelView.subviews[10].transform = .identity
                self.labelView.subviews[11].transform = .identity
                self.labelView.subviews[12].transform = .identity
            } completion: { _ in
                if !self.isAnimating {
                    self.currentLabelIndex = 0
                    self.animateStep1()
                }else {
                    self.isAnimating = false
                    self.currentLabelIndex = 0
                    
                    for i in 0..<self.labelView.subviews.count{
                        self.labelView.subviews[i].backgroundColor = UIColor(named: M.colors[i])
                        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
                            self.labelView.subviews[i].backgroundColor = .clear
                            
                        }
                    }
                }
            }

        }

    }

}
extension RefreshViewController {
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if ((refreshControl?.isRefreshing) != nil) {
            if isAnimating == false {
                animateStep1()
            }
        }
    }
}

