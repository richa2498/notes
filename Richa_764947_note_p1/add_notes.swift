//
//  add_notes.swift
//  Richa_764947_note_p1
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)

class add_notes: UIViewController {
    
    
    @IBOutlet weak var add_text_area: UITextView!
    var delegate1 : note_view_controller?
    var item_name = ""
    var isExists: Bool = false
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        add_text_area.text = item_name

    }
 //MARK : ADD ITEMS TO ARRAY OF NOTES WITH DELEGATE
    override func viewDidDisappear(_ animated: Bool) {

        delegate1?.add_to_list(item: add_text_area.text,isExits: isExists)
        
    }

}
