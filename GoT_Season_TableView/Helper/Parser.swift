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
    
    // [String:Any] downcast from jsonmapping
    static func parseSeason(input: [String:Any]) {
        let mySeasonModel = MySeasonModel()
        if let title = input[GameOfThronesAPI.Season.title] as? String {
            mySeasonModel.title = title
        }
        if let season = input[GameOfThronesAPI.Season.season] as? String {
            mySeasonModel.season = season
        }
        if let episodes = input[GameOfThronesAPI.Season.episodes] as? [[String:Any]] {
            mySeasonModel.episodes = parseEpisode(input: episodes)
        }
        DataSource.myMainModel.seasons.append(mySeasonModel)
    }
    
    static func parseEpisode(input: [[String:Any]]) -> [MyEpisodeModel] {
        var myEpisodeModelList: [MyEpisodeModel] = []
        for episode in input {
            let myEpisodeModel = MyEpisodeModel()
            if let title = episode[GameOfThronesAPI.Episode.title] as? String {
                myEpisodeModel.title = title
            }
            if let released = episode[GameOfThronesAPI.Episode.released] as? String {
                myEpisodeModel.released = released
            }
            if let episode = episode[GameOfThronesAPI.Episode.episode] as? String {
                myEpisodeModel.episode = episode
            }
            if let imdbRating = episode[GameOfThronesAPI.Episode.imdbRating] as? String {
                myEpisodeModel.imdbRating = imdbRating
            }
            if let imdbID = episode[GameOfThronesAPI.Episode.imdbID] as? String {
                myEpisodeModel.imdbID = imdbID
            }
            myEpisodeModelList.append(myEpisodeModel)
        }
        return myEpisodeModelList
    }
    
    //comes later
    static func parseEpisodeDetail(input: [String:Any]) {
        //do after download
    }
}
