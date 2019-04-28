//
//  TableViewController.swift
//  ToDo List
//
//  Created by Riyad on 28/4/19.
//  Copyright © 2019 rtp. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var ToDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toDo1 = ToDo()
        toDo1.name = "Walk the dog"
        toDo1.important = false
        
        let toDo2 = ToDo()
        toDo2.name = "Buy Milk"
        toDo2.important = true
        ToDos = [toDo1,toDo2]
        
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ToDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        let currentTodo = ToDos[indexPath.row]
        
        
        if currentTodo.important
        {
            cell.textLabel?.text = " ‼ " + currentTodo.name
        } else{
            cell.textLabel?.text = currentTodo.name
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo: ToDo = ToDos[indexPath.row]
        print("segue performed \(selectedTodo.name)")
        performSegue(withIdentifier: "ModifyTodo", sender: selectedTodo)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let createVC = segue.destination as? AddViewController {
            createVC.toDoTableVC = self
        }
        if let modifyVC = segue.destination as? ViewToDoViewController {
            if let selectedTodo = sender as? ToDo {
                modifyVC.todo = selectedTodo

            }
        }
    }

}
