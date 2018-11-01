//
//  Phone+CoreDataProperties.swift
//  CoreData_Relation
//
//  Created by TestMac on 31/10/18.
//  Copyright © 2018 TestMac. All rights reserved.
//
//

import Foundation
import CoreData


extension Phone {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Phone> {
        return NSFetchRequest<Phone>(entityName: "Phone")
    }

    @NSManaged public var model: String?
    @NSManaged public var number: String?

}
