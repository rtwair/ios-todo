//
//  TableViewController.swift
//  ToDo List
//
//  Created by Riyad on 28/4/19.
//  Copyright © 2019 rtp. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var ToDos  = [ToDo]()
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDo.fetchRequest()) {
                if let tempToDos = toDosFromCoreData as? [ToDo] {
                    ToDos = tempToDos
                    tableView.reloadData()
                }
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ToDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        let currentTodo = ToDos[indexPath.row]
        
        
        if currentTodo.important
        {
            if let name = currentTodo.name{
                cell.textLabel?.text = " ‼ " + name

            }
        } else{
            cell.textLabel?.text = currentTodo.name
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo: ToDo = ToDos[indexPath.row]
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
