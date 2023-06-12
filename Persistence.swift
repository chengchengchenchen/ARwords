////
////  Persistence.swift
////  Backend
////
////  Created by Ihsiao Huang on 2023/6/9.
////
//
//import Foundation
//import CoreData
//
//
////@objc(WordP)
////public class WordP: NSManagedObject {
////    @NSManaged public var english: String?
////    @NSManaged public var chinese: String?
////    @NSManaged public var occurrence: Int64
////    @NSManaged public var memorized: Int64
////    @NSManaged public var forgot: Int64
////    @NSManaged public var id: UUID?
////}
////
////
////
////@objc(WordBookP)
////public class WordBookP: NSManagedObject {
////    @NSManaged public var batchFinished: Int64
////    @NSManaged public var batchLeft: Int64
////    @NSManaged public var batchSize: Int64
////    @NSManaged public var capacity: Int64
////    @NSManaged public var lastVisitTime: Date?
////    @NSManaged public var name: String?
////    @NSManaged public var wordMemorized: Int64
////    @NSManaged public var wordVisited: Int64
////    @NSManaged public var id: UUID?
////    @NSManaged public var contains: NSSet?
////}
////
////// MARK: Generated accessors for contains
////extension WordBookP {
////    @objc(addContainsObject:)
////    @NSManaged public func addToContains(_ value: WordP)
////
////    @objc(removeContainsObject:)
////    @NSManaged public func removeFromContains(_ value: WordP)
////
////    @objc(addContains:)
////    @NSManaged public func addToContains(_ values: NSSet)
////
////    @objc(removeContains:)
////    @NSManaged public func removeFromContains(_ values: NSSet)
////}
//
//
//struct PersistenceController {
//    static let shared = PersistenceController()
//
//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()
//
//    let container: NSPersistentContainer
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "Backend")
//        if inMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        container.viewContext.automaticallyMergesChangesFromParent = true
//    }
//}

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Backend")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
