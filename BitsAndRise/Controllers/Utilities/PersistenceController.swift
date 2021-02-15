//
//  PersistenceController.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import PersistanceManager
import CoreData

class PersistenceController {

    private let sharedInststance: PersistanceManager

    private init(inMemory: Bool = false) {
        let persistanceContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "BitsAndRise")
            if inMemory {
                container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            } else {
                let defaultUrl = container.persistentStoreDescriptions.first!.url
                let defaultStore = NSPersistentStoreDescription(url: defaultUrl!)
                defaultStore.configuration = "Default"
                defaultStore.shouldMigrateStoreAutomatically = true
                defaultStore.shouldInferMappingModelAutomatically = true
            }
            container.loadPersistentStores { (_: NSPersistentStoreDescription, error: Error?) in
                if let error = error as NSError? {
                    fatalError("\(Date()) Unresolved error \(error) \(error.userInfo)")
                }
            }
            return container
        }()
        self.sharedInststance = PersistanceManager(container: persistanceContainer)
    }

    static let shared = PersistenceController().sharedInststance

}
