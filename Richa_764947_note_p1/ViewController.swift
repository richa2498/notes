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
  
    var currIndex = -1
    @IBOutlet weak var nav_name: UINavigationItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    var notes : [String] = []
    @IBOutlet weak var add_folder: UIBarButtonItem!
    var alert : UIAlertController?
    var canEdit : Bool = false
    @IBOutlet weak var tabl_view: UITableView!
    var num : Int = 1
    var folder : String = ""
   var dele : note_view_controller?
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
            for i in Folder_notes.add_notes
            {
                
                if name == i.folder_name
                {
                    flag = true
                }
            }
          
            if !flag{
            //self.notes.append(name!)
            let f = Folder_notes(folder_name: name ?? "", notes: [])
            Folder_notes.add_notes.append(f)
            
            }
            else{
                let alert2 = UIAlertController(title: "Folder Alredy Exist", message: "Enter a new  name for this folder", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Cancle?", style: .destructive, handler: nil))
                self.present(alert2, animated: true, completion: nil)
            }
        
            self.tabl_view.reloadData()
         
            
        }))
        
        present(alert!, animated: true, completion: nil)
    }
    
    //MARK : RETURNS THE ROWS OF TABLES
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return notes.count
        return Folder_notes.add_notes.count
      }
    
    
      //MARK : DEFINE CELL
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //var cell : UITableViewCell
        
        //cell = UITableViewCell(style: .value1, reuseIdentifier: "folder")
        if let cell = tabl_view!.dequeueReusableCell(withIdentifier: "folder"){
        cell.backgroundColor = UIColor.lightGray
        cell.imageView?.image = #imageLiteral(resourceName: "folder-icon.png")
        cell.textLabel?.text = Folder_notes.add_notes[indexPath.row].folder_name//self.notes[indexPath.row]
        //folder = self.notes[indexPath.row]
       cell.detailTextLabel?.text = "\(Folder_notes.add_notes[indexPath.row].notes.count)"
            return cell
            
        }
        
      return UITableViewCell()
        
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
        Folder_notes.add_notes[destinationIndexPath.row].folder_name = Folder_notes.add_notes[sourceIndexPath.row].folder_name
        
        
        Folder_notes.add_notes[sourceIndexPath.row].folder_name = Folder_notes.add_notes[temp].folder_name
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
            Folder_notes.add_notes.remove(at: indexPath.row)
           self.reloadmytable()
                    }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func reloadmytable(){
        
         tabl_view.reloadData()
    }
    //MARK: TO SEND THE INDEX OF THE SELECTED FOLDER:
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? note_view_controller{
            
            dest.delegateMainView = self
            if let tcell = sender as? UITableViewCell{
               
                if let indexpath = tabl_view.indexPath(for: tcell){
                
                    currIndex = indexpath.row}
                
            }
       
        }
    }
    
}

