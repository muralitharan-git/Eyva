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
    
    internal func saveUserDetails(onSave: @escaping OnSuccess, onError: @escaping OnError) {
        
    }
    
    
//    internal func saveStrategy(_ strategy: Strategy, onSave: @escaping OnSuccess, onError: @escaping OnError) {
//
//        let strategyEntity = NSEntityDescription.entity(forEntityName: "StrategyInfo", in: managedObjectContext)!
//        let strategyInfo = StrategyInfo(entity: strategyEntity, insertInto: managedObjectContext)
//
//        strategyInfo.strategyId = strategy.strategyId
//        strategyInfo.currentPrice = strategy.currentPrice
//        strategyInfo.ticker = strategy.ticker
//        strategyInfo.createdDateTime = strategy.createdDateTime
//        strategyInfo.updatedDateTime = Date()
//        strategyInfo.name = strategy.name
//        strategyInfo.shareURL = strategy.shareURL
//        strategyInfo.sortOrder = 0
//        strategyInfo.companyDescription = strategy.quoteDescription
//        strategyInfo.changePercentage = strategy.changePercentage
//
//        for leg in strategy.legs {
//            let legEntity = NSEntityDescription.entity(forEntityName: "LegInfo", in: managedObjectContext)!
//            let legInfo = LegInfo(entity: legEntity, insertInto: managedObjectContext)
//            legInfo.contracts = Int16(leg.size)
//            legInfo.expiryDate = leg.expiration
//            legInfo.purchasePrice = leg.purchasePrice
//            legInfo.impliedVolatility = leg.volatility
//            legInfo.strikePrice = leg.strike
//            legInfo.type = leg.type == .put ? 1 : leg.type == .call ? 0 : 2
//            legInfo.symbol = leg.symbol
//            legInfo.direction = Int16(leg.direction.rawValue)
//            strategyInfo.addToLegs(legInfo)
//        }
//
//        do {
//            try managedObjectContext.save()
//            onSave()
//        } catch let error as NSError {
//            onError(error)
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
}
