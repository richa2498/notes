//
//  moveFolders.swift
//  Richa_764947_note_p1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class moveFolders: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var delegeteOfNoteView : note_view_controller?
    var alert : UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
    }
    
    //MARK : RETURN NUMBER OF ROWS IN TABLE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Folder_notes.add_notes.count
    }

   
    //MARK : RETURN CELL OF TABLE
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "move_cell", for: indexPath)
        cell.textLabel?.text = Folder_notes.add_notes[indexPath.row].folder_name
        return cell
        
    }
    
    //MARK : MOVE TO THE FOLDER
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            alert = UIAlertController(title: "Move To  \(Folder_notes.add_notes[indexPath.row].folder_name)", message: "Are You Sure?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Move", style: .default) { (action) in
                        Folder_notes.add_notes[indexPath.row].notes +=  self.delegeteOfNoteView!.list
                        self.presentingViewController?.dismiss(animated: true, completion: nil)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                     self.presentingViewController?.dismiss(animated: true, completion: nil)
            }
            //MARK : COLOUR CHANGING OF THE PROPERTIES OF ALERT
            alert?.view.tintColor = .black
            alert?.addAction(cancel)
            alert?.addAction(ok)
            cancel.setValue(UIColor.orange, forKey: "titleTextColor")
            present(alert!, animated: true, completion: nil)
    }
    
    @IBAction func cancle_act(_ sender: Any) {
         presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
