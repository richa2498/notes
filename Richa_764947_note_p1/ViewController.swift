//
//  ViewController.swift
//  Richa_764947_note_p1
//
//  Created by MacStudent on 2019-11-07.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
  
    

    
 
    @IBOutlet weak var edit_btn: UINavigationItem!

    var notes : [String] = []
    @IBOutlet weak var add_folder: UIBarButtonItem!
    var alert : UIAlertController?
    
    @IBOutlet weak var tabl_view: UITableView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = []
       edit_btn.rightBarButtonItem = editButtonItem
        
    }
    
    @IBAction func add_new_folder(_ sender: Any) {
     
        
        alert = UIAlertController(title: "Enter Folder Name", message: "choose one", preferredStyle: .alert)
        alert?.addTextField(configurationHandler: { (utxt) in
            utxt.placeholder = "Name"
        })
        alert?.addAction(UIAlertAction(title: "kindly add", style: .default, handler: { (act) in
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
   
    
    
}

