//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by 김건우 on 10/23/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreData

final class CategoryTableViewController: UITableViewController {

    // MARK: - UIView
    
    lazy var addBarButton = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "plus")
        barButton.target = self
        barButton.action = #selector(addBarButtonPressed)
        return barButton
    }()
    
    // MARK: - Properties
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = delegate.persistentContainer.viewContext
    
    var categories: [Division] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = addBarButton
        
        loadCategories()
    }
    
    // MARK: - Aactions
    
    @objc func addBarButtonPressed() {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        alert.addTextField { field in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { action in
            let newCategory = Division(context: self.context)
            newCategory.name = textField.text!
            print(newCategory.items)
            self.categories.append(newCategory)
            self.saveCategories()
        }
        alert.addAction(addAction)
        present(alert, animated: true)
    }

    // MARK: - TableView Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let itemsVC = segue.destination as? TodoListViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                itemsVC.selectedCategory = categories[indexPath.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteButton = UIContextualAction(style: .destructive, title: "삭제") { (_, _, success: @escaping (Bool) -> Void) in
            self.context.delete(self.categories[indexPath.row])
            self.categories.remove(at: indexPath.row)
            
            self.saveCategories()
        }
        deleteButton.backgroundColor = UIColor.systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteButton])
    }
    
    // MARK: - Data Manipulation Methods
    
    func saveCategories() {
        delegate.saveContext()
        tableView.reloadData()
    }
    
    func loadCategories() {
        do {
            categories = try context.fetch(Division.fetchRequest())
        } catch {
            print("CoreData Fetch Error: \(error)")
        }
        tableView.reloadData()
    }

}
