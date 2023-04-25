//
//  ViewController.swift
//  26-CoreData
//
//  Created by Mesut Gedik on 24.04.2023.
//

import UIKit
import CoreData

class ListTVController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let cCell = "listCell"
    
    var listData: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cCell, for: indexPath)
        cell.textLabel?.text = listData[indexPath.row].title
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "🗑️\nDelete") { action, indexPath in
            print("Delete button pressed")
            self.context.delete(self.listData[indexPath.row])
                
            self.listData.remove(at: indexPath.row)
          
            self.saveData()
             
        }
        delete.backgroundColor = UIColor.systemRed
        
        
        return [delete]
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//        print("button pressed")
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Topic", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Topic", style: .default) { (action) in
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            self.listData.append(newItem)
            
            self.saveData()
           }
        alert.addAction(action)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create a New Task"
            textField = alertTextField
        
        }
       present(alert, animated: true, completion: nil)
    }
    
    func loadData() {
        let request : NSFetchRequest <Item> = Item.fetchRequest()
        do{
           listData =  try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    func saveData () {
        do{
           try context.save()
        } catch{
            print("Error saving,\(error)")
        }
        tableView.reloadData()
    }
    
}

