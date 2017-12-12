//
//  GameOfThronesAPI.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/9/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

struct GameOfThronesAPI {
    //http://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones //or id: http://www.omdbapi.com/?apikey=6bfb4e66&i=tt0944947
    //http://www.omdbapi.com/?apikey=6bfb4e66&i=tt0944947&season=1
    
    
    enum DownloadType {
        case main
        case season
        case episodeDetails
    }
    
    //GameOfThronesAPI.Endpoints.title + GameOfThronesAPI.EndPoint.season + \(season) + GameOfThronesAPI.EndPoint.episode + \(episode)
    struct EndPoint {
//        static let main = "https://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones"
        static let main = "https://www.omdbapi.com/?apikey=6bfb4e66"
        static let gameOfThrones = "&t=Game+Of+Thrones"
        static let season = "&season=" //"http://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones&season="
        static let episode = "&i="   //https://www.omdbapi.com/?apikey=6bfb4e66&i=tt5775874 .... or... "http://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones&season=1&episode=1"
    }
    
    struct Main {
        static let totalSeason = "totalSeasons"
    }
    
    struct Season {
        static let title = "Title"
        static let season = "Season"
        static let episodes = "Episodes"
    }
    
    struct Episode {
        static let title = "Title"
        static let released = "Released"
        static let episode = "Episode"
        static let imdbRating = "imdbRating"
        static let imdbID = "imdbID"
    }
    
    struct EpisodeDetail {
        static let title = "Title"
        static let year = "Year"
        static let rated = "Rated"
        static let released = "Released"
        static let season = "Season"
        static let episode = "Episode"
        static let runtime = "Runtime"
        static let genre = "Genre"
        static let director = "Director"
        static let writer = "Writer"
        static let actors = "Actors"
        static let plot = "Plot"
        static let language = "Language"
        static let country = "Country"
        static let awards = "Awards"
        static let poster = "Poster"
        static let imdbRating = "imdbRating"
        static let imdbVotes = "imdbVotes"
        static let imdbID = "imdbID"
        static let seriesID = "seriesID"
    }
}
