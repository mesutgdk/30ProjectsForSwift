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
        // Do any additional setup after loading the view.
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ourOath.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellHeight = tableView(self.tableView, heightForRowAtIndexPath: NSIndexPath(forRow: indexPath.row, inSection: indexPath.section))

        let cell = TableViewCell(frame: CGRectMake(0, 0, self.view.frame.width, cellHeight), title: titleArray[indexPath.row])
        //tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        cell.cellLabel.text = ourOath[indexPath.row]
        return cell
    }
}

