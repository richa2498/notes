//
//  note_view_controller.swift
//  Richa_764947_note_p1
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class note_view_controller: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
       
        // Do any additional setup after loading the view.
    }
    
    func num_of_rows()-> Int {
//        print(arr.count)
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell
              
               cell = UITableViewCell(style: .value1, reuseIdentifier: "note_cell")
               cell.backgroundColor = UIColor.lightGray
                cell.textLabel?.text = ""
               return cell
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
