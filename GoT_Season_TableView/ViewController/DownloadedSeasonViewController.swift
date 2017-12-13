//
//  DownloadedSeasonViewController.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/12/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class DownloadedSeasonViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var sectionRowSelected: (section: Int, row: Int)?

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let seasonTableViewCellNib: UINib = UINib(nibName: Keys.Xib.SeasonTableViewCellId, bundle: nil)
        tableView.register(seasonTableViewCellNib, forCellReuseIdentifier: Keys.Xib.SeasonTableViewCellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CoreDataManager().setDownloadedEpisodeDetail() //data changes and will need to set the episode details everytime
        print(DataSource.downloadedEpisodeList) //for checking is the season episode details updated
        tableView.reloadData() //need to reload table when coming from AvailableSeasonVC
        print("DownloadedSeasonViewController viewWillAppear")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //assign values to availableEpisodeDetailsVC
        
        if let destVC = segue.destination as? EpisodeDetailViewController, let sectionRowSelected = sectionRowSelected, let episodeDetail = DataSource.downloadedEpisodeList[sectionRowSelected.row].episodeDetail {
            
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

extension DownloadedSeasonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = DataSource.myMainModel.seasons[section].episodes?.count {
            return DataSource.downloadedEpisodeList.count
        } else {
            print("Calculated Invalid Number of Rows")
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.Xib.SeasonTableViewCellId) as? SeasonTableViewCell else {
            return UITableViewCell()
        }
        let episode = DataSource.downloadedEpisodeList[indexPath.row]
        cell.title.text = episode.title
        cell.released.text = episode.released
        cell.imdbRating.text = episode.imdbRating
        cell.buttonOutlet.setTitle("Delete", for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        print("commit")
        //does insert need commit?
        
        //modified for Core Data
        if editingStyle == .delete {
            let episode = DataSource.downloadedEpisodeList[indexPath.row]
            episode.downloaded = !episode.downloaded
            CoreDataManager().updateDownloadStatusForAvailable() 
            DataSource.downloadedEpisodeList.remove(at: indexPath.row)
            CoreDataManager().clear()
            CoreDataManager().insertAllToCoreData()
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension DownloadedSeasonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeSelected = DataSource.downloadedEpisodeList[indexPath.row] 
        guard let episodeDetails = episodeSelected.episodeDetail else {
            return
        }
        print("Episode Seasons: \(episodeDetails.season), Episode number: \(episodeDetails.episode), Episode Title: \(episodeDetails.title)")
        
        sectionRowSelected = (0, indexPath.row)
        performSegue(withIdentifier: Keys.Segue.downloadedSeasonVCtoDetailVC, sender: self)
    }
}

