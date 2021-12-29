//
//  Vital+CoreDataProperties.swift
//  
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//
//

import Foundation
import CoreData


extension Vital {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vital> {
        return NSFetchRequest<Vital>(entityName: "Vital")
    }

    @NSManaged public var heartrate: Float
    @NSManaged public var glucose: Float
    @NSManaged public var oxygen: Float
    @NSManaged public var temperature: Float
    @NSManaged public var systolic: Float
    @NSManaged public var diastolic: Float
    @NSManaged public var stressLevel: Float
    @NSManaged public var recordedDate: Date?

}
