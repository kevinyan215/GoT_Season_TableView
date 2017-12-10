//
//  NetworkManager.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/9/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

//also be aware of memory leaks.. might have to include weak... later
class NetworkManager {
    var delegate: NetworkManagerDelegate?
    
    func downloadMain(){
        let urlString = GameOfThronesAPI.EndPoint.main
        downloadEndPoint(urlString: urlString, downloadType: .main)
//        guard let url = URL(string: urlString) else {
//            print("invalid url")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,url,error) in
//            if error != nil {
//                print("error with URLSession data task: \(error)")
//                return
//            }
//            do {
//                if let data = data {
//                    if let serializedJson = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any]{
////                        print(serializedJson)
////                        Dispatch queue?
//                        DispatchQueue.main.async {
//                            Parser.parseMain(input: serializedJson)
//                        }
//                        //parsing to your models...
//                    //delegate do xyz after downloading
////                    self.delegate?.didDownload()
//                    }
//                }
//            } catch {
//                print("error with JSONSerialization: \(error)")
//            }
//        })
//        task.resume()
    }
    
    func downloadSeasons() {
//        guard let totalSeason = DataSource.myMainModel.totalSeasons else {
//            print("canceled download seasons. Invalid total season in DataSource.main.totalseasons")
//            return
//        }
        let totalSeason = 8
        for season in 1...totalSeason {
            let endPoint = GameOfThronesAPI.EndPoint.main + GameOfThronesAPI.EndPoint.season + "\(season)"
//            print(endPoint)
            downloadEndPoint(urlString: endPoint, downloadType: .season)
        }
    }
    
    //comes later
    func downloadEpisodes() {
    }
    
    //api stuff
//    let season = 7
//    let episode = 7
//    let endPoint = GameOfThronesAPI.EndPoint.title + GameOfThronesAPI.EndPoint.season + "\(season)" + GameOfThronesAPI.EndPoint.episode + "\(episode)"
//    print(endPoint)
    func downloadEndPoint(urlString: String, downloadType: GameOfThronesAPI.DownloadType) {
        guard let url = URL(string: urlString) else {
            print("invalid url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,url,error) in
            if error != nil {
                print("error with URLSession data task: \(error)")
                return
            }
            do {
                if let data = data {
                    if let serializedJson = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any]{
                        //Dispatch queue?
//                        print(serializedJson) //executed after main thread finishes?
                        DispatchQueue.main.async {
//                            let downloadType: GameOfThronesAPI.DownloadType = GameOfThronesAPI.DownloadType.main
                            print("Download Type: \(downloadType), Serialized Json: \(serializedJson)") // runs on main thread?
                            switch downloadType {
                            case .main:
                                print("Parse Main")
                                Parser.parseMain(input: serializedJson)
                            case .season:
                                Parser.parseSeason(input: serializedJson)
                                print("Parse Season")
                            case .episodeDetails:
                                print("Parse Episode Details")
                                Parser.parseEpisodeDetails(input: serializedJson)
                            }
                        }
                        //parsing to your models...
                        //delegate do xyz after downloading
                        //                    self.delegate?.didDownload()
                    }
                }
            } catch {
                print("error with JSONSerialization: \(error)")
            }
        })
        task.resume()
    }
}
