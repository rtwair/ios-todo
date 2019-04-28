//
//  ViewToDoViewController.swift
//  ToDo List
//
//  Created by Riyad on 28/4/19.
//  Copyright © 2019 rtp. All rights reserved.
//

import UIKit

class ViewToDoViewController: UIViewController {

    var todo: ToDo = ToDo()
    
    
    @IBOutlet weak var ToDoNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoNameLabel.text = todo.name

    }
    


    @IBAction func CompleteButton(_ sender: Any) {
        print("complete was clicked")
        print("selectedTodo \(todo.name)")
    }
    
}
