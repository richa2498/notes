//
//  ViewController.swift
//  Richa_764947_note_p1
//
//  Created by MacStudent on 2019-11-07.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    

    
 
    @IBOutlet weak var edit_btn: UINavigationItem!

    @IBOutlet weak var editBtn: UIBarButtonItem!
    var notes : [String] = []
    @IBOutlet weak var add_folder: UIBarButtonItem!
    var alert : UIAlertController?
    var canEdit : Bool = false
    @IBOutlet weak var tabl_view: UITableView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = []
       
       
        
    }
    

    @IBAction func on_edit(_ sender: UIBarButtonItem) {
        
        if editBtn.title == "Edit"
        {
            editBtn.title = "Done"
           tabl_view.isEditing = true
           
          
            
        }else {
        editBtn.title = "Edit"
            tabl_view.isEditing = false
            
        }
        
        
        
    }
    
    @IBAction func add_new_folder(_ sender: Any) {
     
        
        alert = UIAlertController(title: "Enter Folder Name", message: "choose one", preferredStyle: .alert)
        alert?.addTextField(configurationHandler: { (utxt) in
            utxt.placeholder = "Name"
        })
        alert?.addAction(UIAlertAction(title: "Cancle?", style: .destructive, handler: nil))
        alert?.addAction(UIAlertAction(title: "Add New Folder", style: .default, handler: { (act) in
            let name = self.alert?.textFields?.first?.text

            self.notes.append(name!)
         
            self.tabl_view.reloadData()
         
            
        }))
        present(alert!, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
      }
    
    
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "folder")
        cell.imageView?.image = #imageLiteral(resourceName: "folder-icon.png")
        cell.textLabel?.text = self.notes[indexPath.row]
        print("insidde tableview cell")
        print(notes[indexPath.row])
      
          return cell
      }
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
        var temp = destinationIndexPath.row
        notes[destinationIndexPath.row] = notes[sourceIndexPath.row]
        notes[sourceIndexPath.row] = notes[temp]
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
 
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") { (act, v, _) in
            self.notes.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
}

