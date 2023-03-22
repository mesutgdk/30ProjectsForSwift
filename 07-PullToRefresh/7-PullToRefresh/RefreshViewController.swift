//
//  ViewController.swift
//  7-PullToRefresh
//
//  Created by Mesut Gedik on 17.03.2023.
//

import UIKit

class RefreshViewController: UITableViewController {

    let emojiArray : Array = ["😄","😀","😆","😁","😆","🥹","😂","🤣","🥲","😊","😇","☺️","🙃","😉","😍","😘","😗","😙","😋","😝","😜","🤪","🤨","🧐","🤓","😎","🤩","🤩","😏","😞","😩","😕","😭","😢","🥺","😡","🤬","🤯","🥶","🥵","😱","🤥","🫡","🙄","🥱","😴","🤢","🤮","🤧","🤑","😷","👻","☠️","😾","🙀","👩🏽‍🚒","🧝‍♂️","👯‍♀️","👩🏻‍🦼","🚶🏽‍♂️","🧍🏼‍♂️","👼🏿","🤴","🧙🏼","🦹🏿","🧜🏼","🎅🏻","🧝🏿","🥷🏻","🤱🏾","🦄","🦭","🐤","🙉","🐮","🐶","🧎🏼","🧏🏻‍♂️","🐝","🦦","🐾","🍭","🚀","🚁","🤕","😵","👩‍❤️‍💋‍👨","🤷🏿‍♀️","🧖🏽‍♀️","🧞‍♂️","👨🏻‍💼","👩🏻‍🔧","👨🏿‍🦲","👨🏻‍🦲","👨‍🦲","👨🏻‍🎓","🧑‍💻","👩🏻‍🎨","👨🏽‍🌾","💂🏼‍♀️","🤩","🏆","🂶","🆘","💟","❤️","😶","🥴","🤫","🫥","🎃","🤛🏿","🤜🏻","👎🏻"]
    
    let cell:String = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView?.backgroundColor = UIColor.black
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
        
        
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        let n1 = emojiArray.count
        let n = Int.random(in: 0 ... n1-1)
        let smiley = "\(emojiArray[n]) \(emojiArray[n]) \(emojiArray[n]) \(emojiArray[n]) \(emojiArray[n])"
        cell.textLabel?.text = smiley
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.black
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  100.0
    }
    @objc func callPullToRefresh() {
        self.fetchAPIData()
        
        }
    func fetchAPIData () {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
}

//extension NSObject {
//
//    public var emojiString: String {
//        let pointer = Unmanaged.passUnretained(self).toOpaque()
//        // You can adjust your range
//        //let range = 0x1F600...0x1F64F
//        let range = 0x1F300...0x1F3F0
//        let index = (pointer.hashValue % range.count)
//        let ord = range.lowerBound + index
//        guard let scalar = UnicodeScalar(ord) else { return "❓" }
//        return String(scalar)
//    }
//
//}

