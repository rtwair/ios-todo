//
//  ViewToDoViewController.swift
//  ToDo List
//
//  Created by Riyad on 28/4/19.
//  Copyright © 2019 rtp. All rights reserved.
//

import UIKit

class ViewToDoViewController: UIViewController {

    var todo:ToDo? = nil
    
    @IBOutlet weak var ToDoNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeTodo = todo{
            let exclamation: String = (safeTodo.important) ? "!" : ""
            //let exclamation: String = resultPrice > 50 ? "!" : ""
            guard let safeName = safeTodo.name else {
                return
            }
            ToDoNameLabel.text = "  \(exclamation)  \(safeName)  "
        }
        
    }
    @IBAction func CompleteButton(_ sender: Any) {
        print("complete was clicked")
        // delete todo
        guard let toDoDel = todo else {
            return
        }
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            context.delete(toDoDel)
        }
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        // pop back
        navigationController?.popViewController(animated: true)
        //print("selectedTodo \(todo.name)")
    }
    
}
