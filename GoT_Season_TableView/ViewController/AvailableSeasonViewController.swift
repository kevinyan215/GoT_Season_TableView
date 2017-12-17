//
//  AvailableSeasonViewController.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/10/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class AvailableSeasonViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var sectionRowSelected: (section: Int, row: Int)?
    
    override func viewDidLoad(){
        //network stuff
        let networkManager = NetworkManager()
        networkManager.delegate = self
        networkManager.downloadMain()
        networkManager.downloadSeasons()
        networkManager.downloadEpisodeDetail()
        
        //core data stuff
        let dataManager = CoreDataManager()
        dataManager.clear()
        
        //Getting the Downloaded Episodes from Core Data to cache
        DataSource.downloadedEpisodeList = dataManager.getEpisodeList()
        CoreDataManager().updateDownloadStatusForAvailable()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Creating/instantiating the nib -> then use TableView to register it
        let seasonTableViewCellNib: UINib = UINib(nibName: Keys.Xib.SeasonTableViewCellId, bundle: nil)
        tableView.register(seasonTableViewCellNib, forCellReuseIdentifier: Keys.Xib.SeasonTableViewCellId)
        
        print("end of AvailableSeasonViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData() //to update buttons when episode is deleted from downloaded VC
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //assign values to availableEpisodeDetailsVC
        
        if let destVC = segue.destination as? EpisodeDetailViewController, let sectionRowSelected = sectionRowSelected, let episodeDetail = DataSource.myMainModel.seasons[sectionRowSelected.section].episodes?[sectionRowSelected.row].episodeDetail {
            
            //use coalescing operator to set N/A if there are no values..
            destVC.bundleContainer[Keys.EpisodeDetailViewController.title] = episodeDetail.title ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.year] = episodeDetail.year ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.rated] = episodeDetail.rated ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.released] = episodeDetail.released ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.season] = episodeDetail.season ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.episode] = episodeDetail.episode ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.runtime] = episodeDetail.runtime ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.genre] = episodeDetail.genre ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.director] = episodeDetail.director ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.writer] = episodeDetail.writer ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.actors] = episodeDetail.actors ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.plot] = episodeDetail.plot ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.language] = episodeDetail.language ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.country] = episodeDetail.country ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.awards] = episodeDetail.awards ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.poster] = episodeDetail.poster ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.imdbRating] = episodeDetail.imdbRating ?? "N/A"
            destVC.bundleContainer[Keys.EpisodeDetailViewController.imdbVotes] = episodeDetail.imdbVotes ?? "N/A"
            
        } else {
            print("Getting nil episode detail @ prepareForSegue")
        }
    }
}

extension AvailableSeasonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = DataSource.myMainModel.seasons[section].episodes?.count {
            return numberOfRows
        } else {
            print("Calculated Invalid Number of Rows")
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.Xib.SeasonTableViewCellId) as? SeasonTableViewCell else {
            return UITableViewCell()
        }
        if let episode = DataSource.myMainModel.seasons[indexPath.section].episodes?[indexPath.row] {
            cell.title.text = episode.title
            cell.released.text = episode.released
            cell.imdbRating.text = episode.imdbRating
//            let buttonTitle = episode.downloaded ? "Delete" : "Download"
//            cell.buttonOutlet.setTitle(buttonTitle, for: .normal)
            let buttonImage = episode.downloaded ? #imageLiteral(resourceName: "delete_button") : #imageLiteral(resourceName: "download_button")
            cell.buttonOutlet.setImage(buttonImage, for: .normal)
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = DataSource.myMainModel.totalSeasons {
            return sections
        } else {
            print("Calculated Invalid Number of Sections")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let title = DataSource.myMainModel.seasons[section].season {
            return "Season \(title)"
        } else {
            print("Invalid Title. Using Default")
            return "Title"
        }
    }
}

//delegate here
extension AvailableSeasonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let episodeSelected = DataSource.myMainModel.seasons[indexPath.section].episodes?[indexPath.row], let episodeDetails = episodeSelected.episodeDetail else {
            return
        }
        print("Episode Seasons: \(episodeDetails.season), Episode number: \(episodeDetails.episode), Episode Title: \(episodeDetails.title)")

        sectionRowSelected = (indexPath.section, indexPath.row)
        performSegue(withIdentifier: Keys.Segue.availableSeasonVCtoDetailVCSegue, sender: self)
    }
}

extension AvailableSeasonViewController: NetworkManagerDelegate {
    func didDownload() {
        print("reloaded data")
        tableView.reloadData()
    }
    

}


