//
//  Episode+CoreDataProperties.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/10/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//
//

import Foundation
import CoreData


extension Episode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Episode> {
        return NSFetchRequest<Episode>(entityName: "Episode")
    }

    @NSManaged public var title: String?
    @NSManaged public var released: String?
    @NSManaged public var imdbRating: String?
    @NSManaged public var imdbID: String?

}
