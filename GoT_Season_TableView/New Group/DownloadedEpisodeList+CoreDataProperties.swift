//
//  DownloadedEpisodeList+CoreDataProperties.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/12/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//
//

import Foundation
import CoreData


extension DownloadedEpisodeList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DownloadedEpisodeList> {
        return NSFetchRequest<DownloadedEpisodeList>(entityName: "DownloadedEpisodeList")
    }

    @NSManaged public var episodes: NSSet?

}

// MARK: Generated accessors for episodes
extension DownloadedEpisodeList {

    @objc(addEpisodesObject:)
    @NSManaged public func addToEpisodes(_ value: Episode)

    @objc(removeEpisodesObject:)
    @NSManaged public func removeFromEpisodes(_ value: Episode)

    @objc(addEpisodes:)
    @NSManaged public func addToEpisodes(_ values: NSSet)

    @objc(removeEpisodes:)
    @NSManaged public func removeFromEpisodes(_ values: NSSet)

}
