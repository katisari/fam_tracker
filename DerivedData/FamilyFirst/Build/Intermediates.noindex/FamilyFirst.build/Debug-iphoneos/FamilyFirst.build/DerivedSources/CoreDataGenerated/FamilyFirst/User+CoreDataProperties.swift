//
//  User+CoreDataProperties.swift
//  
//
//  Created by Katie  Lee on 7/17/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var group_id: NSObject?
    @NSManaged public var location: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var num: Int64
    @NSManaged public var password: String?

}
