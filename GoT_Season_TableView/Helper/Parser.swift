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
    
    static func parseEpisodeDetail(input: [String:Any]) -> MyEpisodeDetailModel? {
        let myEpisodeDetailModel = MyEpisodeDetailModel()
        if let title = input[GameOfThronesAPI.EpisodeDetail.title] as? String {
            myEpisodeDetailModel.title = title
        }
        if let year = input[GameOfThronesAPI.EpisodeDetail.year] as? String {
            myEpisodeDetailModel.year = year
        }
        if let rated = input[GameOfThronesAPI.EpisodeDetail.rated] as? String {
            myEpisodeDetailModel.rated = rated
        }
        if let released = input[GameOfThronesAPI.EpisodeDetail.released] as? String {
            myEpisodeDetailModel.released = released
        }
        if let season = input[GameOfThronesAPI.EpisodeDetail.season] as? String {
            myEpisodeDetailModel.season = season
        }
        if let episode = input[GameOfThronesAPI.EpisodeDetail.episode] as? String {
            myEpisodeDetailModel.episode = episode
        }
        if let runtime = input[GameOfThronesAPI.EpisodeDetail.runtime] as? String {
            myEpisodeDetailModel.runtime = runtime
        }
        if let genre = input[GameOfThronesAPI.EpisodeDetail.genre] as? String {
            myEpisodeDetailModel.genre = genre
        }
        if let director = input[GameOfThronesAPI.EpisodeDetail.director] as? String {
            myEpisodeDetailModel.director = director
        }
        if let writer = input[GameOfThronesAPI.EpisodeDetail.writer] as? String {
            myEpisodeDetailModel.writer = writer
        }
        if let actors = input[GameOfThronesAPI.EpisodeDetail.actors] as? String {
            myEpisodeDetailModel.actors = actors
        }
        if let plot = input[GameOfThronesAPI.EpisodeDetail.plot] as? String {
            myEpisodeDetailModel.plot = plot
        }
        if let language = input[GameOfThronesAPI.EpisodeDetail.language] as? String {
            myEpisodeDetailModel.language = language
        }
        if let country = input[GameOfThronesAPI.EpisodeDetail.country] as? String {
            myEpisodeDetailModel.country = country
        }
        if let awards = input[GameOfThronesAPI.EpisodeDetail.awards] as? String {
            myEpisodeDetailModel.awards = awards
        }
        if let poster = input[GameOfThronesAPI.EpisodeDetail.poster] as? String {
            myEpisodeDetailModel.poster = poster
        }
        if let imdbRating = input[GameOfThronesAPI.EpisodeDetail.imdbRating] as? String {
            myEpisodeDetailModel.imdbRating = imdbRating
        }
        if let imdbVotes = input[GameOfThronesAPI.EpisodeDetail.imdbVotes] as? String {
            myEpisodeDetailModel.imdbVotes = imdbVotes
        }
//        print("myEpisodeDetailModel: year: \(myEpisodeDetailModel.year) , season: \(myEpisodeDetailModel.season), episode: \(myEpisodeDetailModel.episode)")
        return myEpisodeDetailModel
    }
}
