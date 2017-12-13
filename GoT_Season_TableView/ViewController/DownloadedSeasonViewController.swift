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
    
    override func viewDidLoad() {
        tableView.dataSource = self
        
        let seasonTableViewCellNib: UINib = UINib(nibName: Keys.Xib.SeasonTableViewCellId, bundle: nil)
        tableView.register(seasonTableViewCellNib, forCellReuseIdentifier: Keys.Xib.SeasonTableViewCellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData() //need to reload table when coming from AvailableSeasonVC
        print("DownloadedSeasonViewController viewWillAppear")
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
}

