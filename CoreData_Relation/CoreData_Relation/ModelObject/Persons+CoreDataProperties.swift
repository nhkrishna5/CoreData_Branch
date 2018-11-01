//
//  Persons+CoreDataProperties.swift
//  CoreData_Relation
//
//  Created by TestMac on 31/10/18.
//  Copyright © 2018 TestMac. All rights reserved.
//
//

import Foundation
import CoreData


extension Persons {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persons> {
        return NSFetchRequest<Persons>(entityName: "Persons")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: Phone?
    @NSManaged public var friend: NSSet?

}

// MARK: Generated accessors for friend
extension Persons {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: Friends)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: Friends)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}
