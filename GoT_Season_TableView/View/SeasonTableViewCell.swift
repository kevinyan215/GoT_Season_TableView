//
//  AvailableSeasonTableViewCell.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/10/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class SeasonTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    //cant access tableview yet..
//    override func awakeFromNib() {}
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let contentView = sender.superview, let tableViewCell = contentView.superview as? UITableViewCell, let tableView = tableViewCell.superview as? UITableView else {
            return
        }
        if let cellIndexPath = tableView.indexPath(for: tableViewCell), let row = tableView.indexPath(for: tableViewCell)?.row, let section = tableView.indexPath(for: tableViewCell)?.section {
            print("section: \(section), row: \(row)")
            if let viewController = self.next?.next?.next as? AvailableSeasonViewController {
                if let episode = DataSource.myMainModel.seasons[section].episodes?[row] {
                    print(episode.downloaded)
                    episode.downloaded = !episode.downloaded
                    if episode.downloaded {
                        DataSource.downloadedEpisodeList.append(episode)
                        CoreDataManager().insertToCoreData(episode: episode) //insert to core data. might can do this later. when user exits. don't have to insert to core data now, can just use local model
                        buttonOutlet.setTitle("Delete", for: .normal)
                    } else {
                        //might be better to use a set. more efficient. this works for now though..
                        for (index,deleteEpisode) in DataSource.downloadedEpisodeList.enumerated() {
                            if deleteEpisode.imdbID == episode.imdbID {
                                DataSource.downloadedEpisodeList.remove(at: index)
                            }
                        }
                        buttonOutlet.setTitle("Download", for: .normal)
                        
                        //remove from core data. same thing. probably can remove from core data later. just remove from local model now
                    }
                    print("@ AvailableSeasonViewController" )
                    print("Downloaded Episodes: \(DataSource.downloadedEpisodeList)")
                }
            }
            
            else if let viewController = self.next?.next?.next as? DownloadedSeasonViewController {
                print("DownloadedSeasonViewController")
                if let episode = DataSource.downloadedEpisodeList[row] as? MyEpisodeModel {
                    print(episode.downloaded)
                    episode.downloaded = !episode.downloaded
                    CoreDataManager().updateDownloadStatusForAvailable() 
                    //might be better to use a set. more efficient. this works for now though..
                    for (index,deleteEpisode) in DataSource.downloadedEpisodeList.enumerated() {
                        if deleteEpisode.title == episode.title {
                            DataSource.downloadedEpisodeList.remove(at: index)
                        }
                    }
                    tableView.beginUpdates()
                    tableView.deleteRows(at: [cellIndexPath], with: .automatic)
                    tableView.endUpdates()
                    
                    //refractor later
                    CoreDataManager().clear()
                    CoreDataManager().insertAllToCoreData()
                    //remove from core data. same thing. probably can remove from core data later. just remove from local model now
                    
                    print("@ DownloadedSeasonViewController" )
                    print("Removed Episodes: \(episode)")
                }
//                tableView.reloadData() //uncomment later when you implement delete... or whatever
            }
        }
    }
}
