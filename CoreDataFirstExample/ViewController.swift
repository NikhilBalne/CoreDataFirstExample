//
//  ViewController.swift
//  CoreDataFirstExample
//
//  Created by Nikhilkumar Balne on 21/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        createAnEmployee()
        fetchAnEmployee()
    }

    private func createAnEmployee(){
        let employee = Employee(context: PersistantContainer.shared.context)
        employee.name = "Nikhil"
        PersistantContainer.shared.saveContext()
    }
    
    private func fetchAnEmployee(){
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        print(path[0])
        
        do {
            
            guard let employee = try PersistantContainer.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else { return }
            employee.forEach({
                print("Name:\($0.name)")
            })
            
            
        } catch let error {
            print("Error:\(error)")
        }
        
    }

}

