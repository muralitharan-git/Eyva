//
//  Vital+CoreDataProperties.swift
//  
//
//  Created by Muralitharan on 03/01/22.
//
//

import Foundation
import CoreData


extension Vital {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vital> {
        return NSFetchRequest<Vital>(entityName: "Vital")
    }

    @NSManaged public var diastolic: Float
    @NSManaged public var glucose: Float
    @NSManaged public var heartrate: Float
    @NSManaged public var oxygen: Float
    @NSManaged public var recordedDate: Date?
    @NSManaged public var stressLevel: Float
    @NSManaged public var systolic: Float
    @NSManaged public var temperature: Float
    @NSManaged public var haemoglobin: Float

}
