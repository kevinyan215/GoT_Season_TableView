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

    func getEpisodeList() -> [MyEpisodeModel] {
        let managedObjectContext = getContext()
        var episodeList: [MyEpisodeModel] = []
        let fetchRequest = NSFetchRequest<Episode>(entityName: CoreDataKey.Entity.episode)

        do {
            let results: [Episode] = try managedObjectContext.fetch(fetchRequest)
            for result in results {
                let episodeModel = MyEpisodeModel()
                episodeModel.title = result.title
                episodeModel.released = result.released
                episodeModel.episode = result.episode
                episodeModel.imdbRating = result.imdbRating
                episodeModel.imdbID = result.imdbID
                episodeModel.downloaded = result.downloaded
                
                episodeList.append(episodeModel)
//                print("Episode Title: \(result.title) released: \(result.released) Downloaded: \(result.downloaded)")
            }
        } catch {
            //error handling...
        }
        return episodeList
    }
    
    
    //update download button when restarting the app
    func updateDownloadStatusForAvailable(){
        compareDownloadsToAvailable { (downloadedEpisode, episode) in
            if episode.title == downloadedEpisode.title {
                episode.downloaded = downloadedEpisode.downloaded
            }
        }
    }
    
    func setDownloadedEpisodeDetail(){
        compareDownloadsToAvailable(handler: {(downloadedEpisode, episode) in
            if downloadedEpisode.title == episode.title {
                downloadedEpisode.episodeDetail = episode.episodeDetail
            }
        })
    }
    
    func compareDownloadsToAvailable(handler: ((MyEpisodeModel, MyEpisodeModel)->Void)) {
        for season in DataSource.myMainModel.seasons {
            for episode in season.episodes! {
                for downloadedEpisode in DataSource.downloadedEpisodeList {
                    handler(downloadedEpisode, episode)
                }
            }
        }
    }
    
    //insert all downloaded episodes to Core Data - have to figure out where to put it in order to use it- where in the app lifecycle?
    func insertAllToCoreData(){
        let managedObjectContext = getContext()
        for episode in DataSource.downloadedEpisodeList {
            insertToCoreData(episode: episode)
        }
        do {
            try managedObjectContext.save()
        } catch {
            //errors
        }
    }

    func insertToCoreData(episode: MyEpisodeModel){
        let managedObjectContext = getContext()
        let episodeManagedObject = Episode(context: managedObjectContext)
        episodeManagedObject.title = episode.title
        episodeManagedObject.released = episode.released
        episodeManagedObject.imdbRating = episode.imdbRating
        episodeManagedObject.downloaded = episode.downloaded
        managedObjectContext.insert(episodeManagedObject)
        do {
            try managedObjectContext.save()
        } catch {
            //errors
        }
    }
    
    //not needed now.
//    func delete(episodeList: [Episode]){
//        let managedObjectContext = getContext()
//        for episode in episodeList {
//            managedObjectContext.delete(episode)
//        }
//        do {
//            try managedObjectContext.save()
//        } catch {
//        }
//    }
    
    func clear() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataKey.Entity.episode)
        do {
            if let results = try getContext().fetch(fetchRequest) as? [NSManagedObject] {
                for object in results {
                    getContext().delete(object)
                }
            }
            try getContext().save()
        } catch{
            //error handling
        }
    }
}

