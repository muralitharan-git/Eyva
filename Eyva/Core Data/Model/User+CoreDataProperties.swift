//
//  User+CoreDataProperties.swift
//  
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var age: Int64

}
