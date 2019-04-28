//
//  AddViewController.swift
//  ToDo List
//
//  Created by Riyad on 28/4/19.
//  Copyright © 2019 rtp. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var nameTaskField: UITextField!
    var toDoTableVC: TableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newTodo = ToDo(context: context)
            newTodo.important = importantSwitch.isOn
            if let name = nameTaskField.text  {
                newTodo.name = name
            }
            //(UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
