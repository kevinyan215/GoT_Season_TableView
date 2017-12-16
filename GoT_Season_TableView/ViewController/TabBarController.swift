//
//  ViewController.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/9/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let networkManager = NetworkManager()
//        CoreDataManager().updateDownloadStatusForAvailable()
//        networkManager.downloadEpisodeDetail()
        
        print("""
            DataSource model:
            Seasons: \(DataSource.myMainModel.seasons)
            """)
    }

    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear: \(DataSource.myMainModel.totalSeasons)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        print("viewDidAppear: \(DataSource.myMainModel.totalSeasons)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        print("viewWillDisappear: \(DataSource.myMainModel.totalSeasons)")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        print("viewDidDisappear: \(DataSource.myMainModel.totalSeasons)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

