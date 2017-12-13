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
        //core data stuff
        let dataManager = CoreDataManager()
//        dataManager.clear()
        
        //Local Downloaded Episodes
        DataSource.downloadedEpisodeList = dataManager.getEpisodeList()
    }
}
