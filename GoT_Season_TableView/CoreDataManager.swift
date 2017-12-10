//
//  CoreDataManager.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/9/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        return managedObjectContext
    }
    
    func someFuncNameToGetSeasons() -> [Season] {
        let managedObjectContext = getContext()
        var seasons: [Season] = []
        let fetchRequest = NSFetchRequest<Season>(entityName: CoreDataKey.Entity.season)

        do {
            let results: [Season] = try managedObjectContext.fetch(fetchRequest)
            for result in results {
                print("Season Number: \(result.season) + Season Title: \(result.title)")
            }
            seasons = results
        } catch {
            //error handling...
        }
        
        return seasons
    }
    
    func insert(){
        let managedObjectContext = getContext()
        let seasonManagedObject = Season(context: managedObjectContext)
        seasonManagedObject.season = "5"
        seasonManagedObject.title = "GoT"
        managedObjectContext.insert(seasonManagedObject)

        do {
            try managedObjectContext.save()
        } catch {
            //errors
        }
        
    }
    
    func delete(season: [Season]){
        let managedObjectContext = getContext()
        
        for season in season {
            managedObjectContext.delete(season)
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            
        }
    }
}
