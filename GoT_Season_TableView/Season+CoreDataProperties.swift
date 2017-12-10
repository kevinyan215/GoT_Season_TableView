//
//  Season+CoreDataProperties.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/10/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//
//

import Foundation
import CoreData


extension Season {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Season> {
        return NSFetchRequest<Season>(entityName: "Season")
    }

    @NSManaged public var episodes: NSData?
    @NSManaged public var season: String?
    @NSManaged public var title: String?

}
