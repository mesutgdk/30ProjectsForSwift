//
//  ViewController.swift
//  11-ClearTableView
//
//  Created by Mesut Gedik on 22.03.2023.
//

import UIKit

class TableViewController: UITableViewController {

    let ourOath  = ["Türküm, Doğruyum, Çalışkanım","İlkem: küçüklerimi korumak, büyüklerimi saymak", "Yurdumu, milletimi özümden çok sevmektir","Ülküm: yükselmek, ileri gitmektir","Varlığım Türk varlığına armağan olsun!","Yurtta sulh, dünyada sulh","Benim naçiz vücudum elbet bir gün toprak olacaktır, ancak Türkiye Cumhuriyeti ilelebet payidar kalacaktır.","Sizlere saldırmanızı değil, ölmenizi emrediyorum","En büyük savaş, cahilliğe karşı yapılan savaştır." ,"Eğer bir gün benim sözlerimle bilimle ters düşerse bilimi seçin"]
    let cell = "tableCell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        navigationItem.title = "OUR OATH"
            }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ourOath.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cell) as! TableViewCell
        cell.cellLabel.text = ourOath[indexPath.row]
        cell.backgroundColor = cellColorForIndex(indexPath: indexPath)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}
extension TableViewController {
    //MARK: Instance Methods
    func cellColorForIndex(indexPath:IndexPath) -> UIColor{
    //cast row and section to CGFloat
    let row = CGFloat(indexPath.row)
        
    //compute row as hue and section as saturation
    let saturation  = 1.0 - row / CGFloat(ourOath.count)
    return UIColor(hue: 2, saturation: saturation, brightness: 1.0, alpha: 1.0)
    }
}
