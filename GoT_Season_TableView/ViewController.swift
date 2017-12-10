//
//  ViewController.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/9/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //api stuff
        let season = 7
        let episode = 7
        let endPoint = GameOfThronesAPI.EndPoint.title + GameOfThronesAPI.EndPoint.season + "\(season)" + GameOfThronesAPI.EndPoint.episode + "\(episode)"
        print(endPoint)
        
        //network stuff
        let networkManager = NetworkManager()
        networkManager.seasonAndEpisode(urlString: GameOfThronesAPI.EndPoint.title)
        
        //core data stuff
//        CoreDataManager().insert()
//        let seasons: [Season] = CoreDataManager().someFuncNameToGetSeasons()
//        print("seasons from Core Data: \(seasons)")
//        CoreDataManager().delete(season: seasons)
//        print("deleted?")
//        CoreDataManager().someFuncNameToGetSeasons()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

