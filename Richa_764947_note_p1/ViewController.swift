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
  
  
    @IBOutlet weak var nav_name: UINavigationItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    var notes : [String] = []
    @IBOutlet weak var add_folder: UIBarButtonItem!
    var alert : UIAlertController?
    var canEdit : Bool = false
    @IBOutlet weak var tabl_view: UITableView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = []
        //MARK: TO ENABLE SCROLLING ONE
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor.lightGray
        self.tabl_view.backgroundColor = UIColor.lightGray
        
        
    }
    
    
    //MARK : TO ENABLE EDITING FOR THE REAARANGINFG FOLDERS
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
    //MARK : TO ADD FOLDERS DYNAMICALLY
    @IBAction func add_new_folder(_ sender: Any) {
     
        var flag : Bool = false
        alert = UIAlertController(title: "New Folder", message: "Enter name for this folder", preferredStyle: .alert)
        alert?.addTextField(configurationHandler: { (utxt) in
            utxt.placeholder = "Name"
        })
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
        }

        alert?.view.tintColor = .black
        alert?.addAction(cancel)
       cancel.setValue(UIColor.brown, forKey: "titleTextColor")
       alert?.addAction(UIAlertAction(title: "Add New Folder", style: .default, handler: { (act) in
            let name = self.alert?.textFields?.first?.text
            for i in self.notes{
                
                if name == i
                {
                    flag = true
                }
            }
          
            if !flag{
            self.notes.append(name!)
            }
            else{
                var alert2 = UIAlertController(title: "Folder Alredy Exist", message: "Enter a new  name for this folder", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Cancle?", style: .destructive, handler: nil))
                self.present(alert2, animated: true, completion: nil)
            }
            self.tabl_view.reloadData()
         
            
        }))
        
        present(alert!, animated: true, completion: nil)
    }
    
    //MARK : RETURNS THE ROWS OF TABLES
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
      }
    
    
      //MARK : DEFINE CELL
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell
       
        cell = UITableViewCell(style: .value1, reuseIdentifier: "folder")
        cell.backgroundColor = UIColor.lightGray
        cell.imageView?.image = #imageLiteral(resourceName: "folder-icon.png")
        cell.textLabel?.text = self.notes[indexPath.row]
        return cell
      
    }
    
    //MARK : FOR REAARANGING THE FOLDERS
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
        let  temp = destinationIndexPath.row
        notes[destinationIndexPath.row] = notes[sourceIndexPath.row]
        notes[sourceIndexPath.row] = notes[temp]
    }
    
    //MARK : TO DISABLE DELETE  FUNCTIONALITY WHILE EDITING
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    //MARK : DELETE DATA
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") { (act, v, _) in
            self.notes.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
        
    
    
}

