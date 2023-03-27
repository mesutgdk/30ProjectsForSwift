//
//  ViewController.swift
//  13-AnimeteTable
//
//  Created by Mesut Gedik on 26.03.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    let tableCell = "Cell"
    let mae = MAE ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        // MARK: animation that tableview comes from bottom
//            tableView.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.size.height)
//            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseInOut, animations: {
//                self.tableView.transform = CGAffineTransform.identity
//            }, completion: nil)
        
        for cell in tableView.visibleCells {
                    cell.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.size.height)
                }

                let visibleCells = tableView.visibleCells
               // let tableHeight: CGFloat = tableView.bounds.size.height

                for (index, cell) in visibleCells.enumerated() {
                    let delay = Double(index) * 0.1
                    UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                        cell.transform = CGAffineTransform.identity
                    }, completion: nil)
                }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mae.independenceAnthem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCell, for: indexPath)
        cell.textLabel?.text = mae.independenceAnthem[indexPath.row]
        cell.backgroundColor = cellColorForIndex(indexPath: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
//        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)

        return cell
    }
    

}
extension TableViewController {
    //MARK: Instance Methods
    func cellColorForIndex(indexPath:IndexPath) -> UIColor{
    //cast row and section to CGFloat
    let row = CGFloat(indexPath.row)
        
    //compute row as hue and section as saturation
        let saturation  = row / CGFloat(mae.independenceAnthem.count)
        return UIColor(hue: 2, saturation: saturation, brightness: 0.9, alpha: 0.8)
    }
  
}

