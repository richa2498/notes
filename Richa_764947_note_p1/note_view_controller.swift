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
    

    @IBOutlet weak var table_view: UITableView!
  var folder_name : String = ""
    var list : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
       // var note_struct = Folder_notes(folder_name : self.folder_name, notes: self.list )
       
       
        // Do any additional setup after loading the view.
    }
    
    func add_to_list(item : String) {
        
       self.list.append(item)
        table_view.reloadData()
        
    }
  
    
    
    func num_of_rows()-> Int {
//        print(arr.count)
        return list.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell

                cell = table_view.dequeueReusableCell(withIdentifier: "note_cell")!
               cell.backgroundColor = UIColor.lightGray
        cell.textLabel?.text = list[indexPath.row]
               return cell

        
    }
    
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let notes = segue.destination as? add_notes{
            
            notes.delegate1 = self
            
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
