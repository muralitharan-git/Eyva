//
//  CoreDataManager.swift
//  UpLeg (iOS)
//
//  Created by Muralitharan on 21/12/20.
//

import Foundation
import CoreData

let sharedCoreDataManager = CoreDataManager.getSharedInsatnce()

final class CoreDataManager {
    
    class func getSharedInsatnce() -> CoreDataManager {
        struct Static {
            static let instance = CoreDataManager(modelName: "Evya")
        }
        return Static.instance
    }
    
    private let modelName: String
    
    internal var isEmpty: Bool {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Vital")
            let response  = try managedObjectContext.fetch(request)
            return response.count == 0
        } catch {
            return true
        }
    }
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistantStoreCoordinator
        return managedObjectContext
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to find data model")
        }
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to load data model")
        }
        return managedObjectModel
    }()
    
    private lazy var persistantStoreCoordinator: NSPersistentStoreCoordinator = {
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL, options: nil)
        } catch {
            fatalError("Unable to load persistent store")
        }
        return persistentStoreCoordinator
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name:"UpLeg1")
        container.loadPersistentStores{ (storeDesription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    internal func saveUserDetails(user: UserInfo, onSave: @escaping OnSuccess, onError: @escaping OnError) {
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext)!
        let userDetails = User(entity: userEntity, insertInto: managedObjectContext)
        userDetails.name = user.name
        userDetails.email = user.email
        userDetails.age = Int64(user.age)
        do {
            try managedObjectContext.save()
            onSave()
        } catch let error as NSError {
            onError(error)
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    internal func saveVitalDetails(vital: VitalInfo, onSave: @escaping OnSuccess, onError: @escaping OnError) {
        let vitalEntity = NSEntityDescription.entity(forEntityName: "Vital", in: managedObjectContext)!
        let vitalDetails = Vital(entity: vitalEntity, insertInto: managedObjectContext)
        vitalDetails.heartrate = vital.heartrate
        vitalDetails.glucose = vital.glucose
        vitalDetails.oxygen = vital.oxygen
        vitalDetails.stressLevel = vital.stressLevel
        vitalDetails.temperature = vital.temperature
        vitalDetails.diastolic = vital.diastolic
        vitalDetails.systolic = vital.systolic
        vitalDetails.recordedDate = vital.recorededDate
        do {
            try managedObjectContext.save()
            onSave()
        } catch let error as NSError {
            onError(error)
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
