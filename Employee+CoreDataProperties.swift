//
//  Employee+CoreDataProperties.swift
//  CoreDataFirstExample
//
//  Created by Nikhilkumar Balne on 21/02/21.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?

}

extension Employee : Identifiable {

}
