//
//  Friends+CoreDataProperties.swift
//  CoreData_Relation
//
//  Created by TestMac on 31/10/18.
//  Copyright © 2018 TestMac. All rights reserved.
//
//

import Foundation
import CoreData


extension Friends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friends> {
        return NSFetchRequest<Friends>(entityName: "Friends")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?

}
