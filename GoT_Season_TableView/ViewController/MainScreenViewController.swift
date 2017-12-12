//
//  MainScreenViewController.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/10/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        //network stuff
        let networkManager = NetworkManager()
        networkManager.downloadMain()
        networkManager.downloadSeasons()
        networkManager.downloadEpisodeDetail()
        //        Model.
        //core data stuff
        //        CoreDataManager().insert()
        //        let seasons: [Season] = CoreDataManager().someFuncNameToGetSeasons()
        //        print("seasons from Core Data: \(seasons)")
        //        CoreDataManager().delete(season: seasons)
        //        print("deleted?")
        //        CoreDataManager().someFuncNameToGetSeasons()

    }
}
