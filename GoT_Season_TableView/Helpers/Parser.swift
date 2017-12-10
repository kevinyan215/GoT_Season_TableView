//
//  Parser.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/9/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

class Parser {
    static func parseMain(input: [String:Any]) {
//        let main = Main(context: CoreDataManager().getContext())
//        let main = MyMainModel()
        if let totalSeasons = input[GameOfThronesAPI.Main.totalSeason] as? String {
            if let numbTotalSeasons = Int(totalSeasons) {
//                main.totalSeasons = numbTotalSeasons
                DataSource.myMainModel.totalSeasons = numbTotalSeasons
            }
        }
//        return main
    }
    
    // [String:Any] = result of jsonmapping
    static func parseSeason(input: [String:Any]) {
        let mySeasonModel = MySeasonModel()
        if let title = input[GameOfThronesAPI.Season.title] as? String {
            mySeasonModel.title = title
        }
        if let season = input[GameOfThronesAPI.Season.season] as? String {
            mySeasonModel.season = season
        }
//        if let episodes = input[GameOfThronesAPI.Season.episodes] as? Any {
//            mySeasonModel.episodes = episodes
//        }
        DataSource.myMainModel.seasons.append(mySeasonModel)
    }
    
//    static func parseEpisode
    
    //comes later
    static func parseEpisodeDetails(input: [String:Any]) {
    }
}
