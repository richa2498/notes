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
      
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return Folder_notes.add_notes.count
        
    }

    func edit(){
        
    }
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "move_cell", for: indexPath)
        cell.textLabel?.text = Folder_notes.add_notes[indexPath.row].folder_name
    print(delegeteOfNoteView?.list ?? [])
        return cell
    }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    alert = UIAlertController(title: "Move To  \(Folder_notes.add_notes[indexPath.row].folder_name)", message: "Are You Sure?", preferredStyle: .alert)
           let ok = UIAlertAction(title: "Move", style: .default) { (action) in
            Folder_notes.add_notes[indexPath.row].notes +=  self.delegeteOfNoteView!.list
                   print(Folder_notes.add_notes[indexPath.row].folder_name)
                   print(Folder_notes.add_notes[indexPath.row].notes)
            self.presentingViewController?.dismiss(animated: true, completion: nil)
                   
           }
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                 self.presentingViewController?.dismiss(animated: true, completion: nil)
            }
    
    alert?.view.tintColor = .black
            alert?.addAction(cancel)
           alert?.addAction(ok)
    cancel.setValue(UIColor.orange, forKey: "titleTextColor")
             present(alert!, animated: true, completion: nil)
    
    
        
    }
    
    @IBAction func cancle_act(_ sender: Any) {
        
         presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
