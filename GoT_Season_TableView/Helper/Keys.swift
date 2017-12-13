//
//  Keys.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/10/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

struct Keys {
    struct Segue {
        static let availableSeasonVCtoDetailVCSegue = "availableSeasonVCtoDetailVC"
        static let splashScreenVCtoTabBarVCSegue = "SplashScreenVCtoTabBarVC"
    }
    
    struct EpisodeDetailViewController {
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
    
    struct Xib {
        static let SeasonTableViewCellId = "SeasonTableViewCell"
    }
}
