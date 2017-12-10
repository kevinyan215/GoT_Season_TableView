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
    
    //GameOfThronesAPI.Endpoints.title + GameOfThronesAPI.EndPoint.season + \(season) + GameOfThronesAPI.EndPoint.episode + \(episode)
    struct EndPoint {
        static let title = "https://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones"
        static let season = "&season=" //"http://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones&season="
        static let episode = "&episode="   //"http://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones&season=1&episode=1"
    }
    
    struct Main {
        static let totalSeason = "totalSeasons"
    }
}
