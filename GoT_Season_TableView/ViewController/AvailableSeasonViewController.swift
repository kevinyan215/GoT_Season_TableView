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
    override func viewDidLoad(){
        tableView.dataSource = self
        
        //Creating/instantiating the nib -> then use TableView to register it
        let seasonTableViewCellNib: UINib = UINib(nibName: Keys.Xib.SeasonTableViewCellId, bundle: nil)
        tableView.register(seasonTableViewCellNib, forCellReuseIdentifier: Keys.Xib.SeasonTableViewCellId)
    }
}

extension AvailableSeasonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = DataSource.myMainModel.seasons[section].episodes?.count {
            return numberOfRows
        } else {
            print("Calculated Invalid Number of Rows")
            return 1
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
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = DataSource.myMainModel.totalSeasons {
            return sections
        } else {
            print("Calculated Invalid Number of Sections")
            return 1
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
//        let episodeSelected = indexPath.
    }
}

