//
//  AvailableEpisodeDetailViewController.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/11/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class EpisodeDetailViewController: UIViewController {
    var bundleContainer:[String:Any] = [:]
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rated: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var actors: UILabel!
    @IBOutlet weak var plot: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var awards: UILabel!
    @IBOutlet weak var poster: UILabel!
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var imdbVotes: UILabel!

    
    override func viewDidLoad() {
        let checkEpisodeDetailModel = DataSource.myMainModel.seasons
        
        //force unwrapping again.. may need to refractor later..not good if values don't exist -> app crash -> which is horrible
        episodeTitle.text = bundleContainer[Keys.EpisodeDetailViewController.title] as! String
        year.text = "Year " +  (bundleContainer[Keys.EpisodeDetailViewController.year] as! String)
        rated.text = "Rated " +  (bundleContainer[Keys.EpisodeDetailViewController.rated] as! String)
        released.text = "Released " +  (bundleContainer[Keys.EpisodeDetailViewController.released] as! String)
        season.text = "Season " +  (bundleContainer[Keys.EpisodeDetailViewController.season]! as! String)
        episode.text = "Episode " +  (bundleContainer[Keys.EpisodeDetailViewController.episode]! as! String)
        runtime.text = "Runtime " +  (bundleContainer[Keys.EpisodeDetailViewController.runtime]! as! String)
        genre.text = "Genre " +  (bundleContainer[Keys.EpisodeDetailViewController.genre]! as! String)
        director.text = "Director " +  (bundleContainer[Keys.EpisodeDetailViewController.director]! as! String)
        writer.text = "Writer " +  (bundleContainer[Keys.EpisodeDetailViewController.writer]! as! String)
        actors.text = "Actors " +  (bundleContainer[Keys.EpisodeDetailViewController.actors]! as! String)
        language.text = "Language " +  (bundleContainer[Keys.EpisodeDetailViewController.plot]! as! String)
        country.text = "Country " +  (bundleContainer[Keys.EpisodeDetailViewController.country]! as! String)
        awards.text = "Awards " +  (bundleContainer[Keys.EpisodeDetailViewController.awards]! as! String)
        poster.text = "Poster " +  (bundleContainer[Keys.EpisodeDetailViewController.poster]! as! String)
        imdbRating.text = "ImdbRating " +  (bundleContainer[Keys.EpisodeDetailViewController.imdbRating]! as! String)
        
        
        imdbVotes.text = "Imdb Votes " +  (bundleContainer[Keys.EpisodeDetailViewController.imdbVotes]! as! String)
    }
}
