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
    var struct_note : Folder_notes?
    var index = -1
    var delegateMainView: ViewController?
    var iscellSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.prefersLargeTitles = true
 
    }
    
    func add_to_list(item : String) {
        
       //self.list.append(item)
        Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes.append(item)
        table_view.reloadData()
        
        
    }
    
    func getFolder_name() ->String{
        
        return (delegateMainView?.folder_name())!
    }
  
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes.count//list.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell

                cell = table_view.dequeueReusableCell(withIdentifier: "note_cell")!
                cell.backgroundColor = UIColor.lightGray
                cell.textLabel?.text = Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes[indexPath.row]
        if iscellSelected {cell.accessoryType = .checkmark}
        iscellSelected = false
        return cell
        

        
    }
    
    
  
    override func viewDidDisappear(_ animated: Bool) {
        
    
        delegateMainView?.reloadmytable()
    }
 

    @IBAction func delete_selected(_ sender: Any) {
  
        let i = index
        
        if i != -1{
        
        Folder_notes.add_notes[(delegateMainView?.currIndex)!].notes.remove(at: i)
        table_view.reloadData()
            index = -1}
     
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let notes = segue.destination as? add_notes{
           notes.delegate1 = self
            
            
        }
       
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        iscellSelected = true
        table_view.reloadRows(at: [indexPath], with: .none)
        
    }
   
  

}
