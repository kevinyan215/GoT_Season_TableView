//
//  AvailableEpisodeDetailViewController.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/11/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class AvailableEpisodeDetailViewController: UIViewController {
    var bundleContainer:[String:Any] = [:]
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rated: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var episode: UILabel!
    
    @IBOutlet weak var imdbVotes1: UILabel!

    
    
    @IBOutlet weak var imdbVotes: UILabel!

    
    override func viewDidLoad() {
        let checkEpisodeDetailModel = DataSource.myMainModel.seasons
        
        //force unwrapping again.. may need to refractor later..not good if values don't exist -> app crash -> which is horrible
        episodeTitle.text = bundleContainer[Keys.AvailableEpisodeDetailViewController.title] as! String
        year.text = "Year " +  (bundleContainer[Keys.AvailableEpisodeDetailViewController.year] as! String)
        rated.text = "Rated " +  (bundleContainer[Keys.AvailableEpisodeDetailViewController.rated] as! String)
        released.text = "Released " +  (bundleContainer[Keys.AvailableEpisodeDetailViewController.released] as! String)
        season.text = "Season " +  (bundleContainer[Keys.AvailableEpisodeDetailViewController.season]! as! String)
        episode.text = "Episode " +  (bundleContainer[Keys.AvailableEpisodeDetailViewController.episode]! as! String)
        
        
        imdbVotes.text = "Imdb Votes " +  (bundleContainer[Keys.AvailableEpisodeDetailViewController.imdbVotes]! as! String)
    }
}
