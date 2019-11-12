//
//  note_view_controller.swift
//  Richa_764947_note_p1
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class note_view_controller: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var move_btn: UIBarButtonItem!
    @IBOutlet weak var delete_btn: UIBarButtonItem!
    @IBOutlet weak var table_view: UITableView!
    var folder_name : String = ""
    var list : [String] = []
    var struct_note : Folder_notes?
    var index = -1
    var delegateMainView: ViewController?
    var isSelected: Bool = false
    var alert : UIAlertController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.table_view.backgroundColor = UIColor.lightGray
        self.navigationController?.navigationBar.prefersLargeTitles = true
        table_view.allowsMultipleSelection = true
        move_btn.isEnabled = false
        delete_btn.isEnabled = false
 
    }
    
    func add_to_list(item : String ,isExits : Bool) {
        
        if !isExits{
        Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes.append(item)
        }
        else{
            Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes[index] = item
        }
        
        table_view.reloadData()
        
        
    }
    
    
    
   
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes.count//list.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell

                cell = table_view.dequeueReusableCell(withIdentifier: "note_cell")!
                cell.backgroundColor = UIColor.lightGray
                cell.textLabel?.text = Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes[indexPath.row]
                return cell
        

        
    }
    
    
  
    override func viewDidDisappear(_ animated: Bool) {
        
    
        delegateMainView?.reloadmytable()
    }
 

    @IBAction func delete_selected(_ sender: Any) {

        alert = UIAlertController(title: "Are You Sure You Want to delete", message: "Select ok", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default) { (action) in
            self.deleterows()
        }
         let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
         }

         alert?.view.tintColor = .black
         alert?.addAction(cancel)
        alert?.addAction(ok)
        cancel.setValue(UIColor.brown, forKey: "titleTextColor")
          present(alert!, animated: true, completion: nil)
        
        
        
        
//
    }
   func deleterows() {
    
   if let selectedRows = table_view.indexPathsForSelectedRows {
       // 1
       
       var items = [String]()
       for indexPath in selectedRows  {
           items.append(Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes[indexPath.row])
       }
     list = items
       // 2
       for item in items {
           if let index = Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes.index(of: item) {
               Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes.remove(at: index)
           }
       }
       // 3
       table_view.beginUpdates()
       table_view.deleteRows(at: selectedRows, with: .automatic)
       table_view.endUpdates()
   }
   }
    
    @IBAction func disable_editing(_ sender: Any) {
        
        if delete_btn.isEnabled {
            
        
        delete_btn.isEnabled = false
        move_btn.isEnabled = false
        }else
        {
            delete_btn.isEnabled = true
            move_btn.isEnabled = true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
            if let move = segue.destination as? moveFolders{
            
                move.delegeteOfNoteView = self
                deleterows()
            }
 
       else  if let notes = segue.destination as? add_notes{
            
           notes.delegate1 = self
                
                if let cell = sender as? UITableViewCell{
                    
                    notes.item_name  = cell.textLabel!.text!
                    notes.isExists = true
                    index = table_view.indexPath(for: cell)!.row
                    
                    
                }
                
         
            
            
            
        }
       
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //index = indexPath.row
        table_view.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }
     
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         
           table_view.cellForRow(at: indexPath)?.accessoryType = .detailButton
           
       }
   

  

}
