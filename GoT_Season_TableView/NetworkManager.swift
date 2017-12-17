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
    let mainUrlGoT = GameOfThronesAPI.EndPoint.main + GameOfThronesAPI.EndPoint.gameOfThrones
    let seasonUrlGoT = GameOfThronesAPI.EndPoint.main + GameOfThronesAPI.EndPoint.gameOfThrones + GameOfThronesAPI.EndPoint.season
    let episodeDetailUrlGoT = GameOfThronesAPI.EndPoint.main + GameOfThronesAPI.EndPoint.episode
    
    func downloadMain(){
        let urlString = mainUrlGoT
        downloadEndPoint(urlString: urlString, handler: {(serializedJson) in
            if let serializedJson = serializedJson as? [String:Any]{
                Parser.parseMain(input: serializedJson)
            }
        })
    
    }
    
    func downloadSeasons() {
//        guard let totalSeason = DataSource.myMainModel.totalSeasons else {
//            print("canceled download seasons. Invalid total season in DataSource.main.totalseasons")
//            return
//        }
        let group = DispatchGroup()
        let totalSeason = 8
        for season in 1...totalSeason {
            let endPoint = seasonUrlGoT + "\(season)"
//            print(endPoint)
            group.enter()
            downloadEndPoint(urlString: endPoint, handler: {(serializedJson) in
                if let serializedJson = serializedJson as? [String:Any]{
                    Parser.parseSeason(input: serializedJson)
                    print("finished parseSeason")
                    group.leave()
                }
            })
        }
        group.notify(queue: DispatchQueue.main, execute: {() in
            self.delegate?.didDownload()
            print("called delegate in downloadSeasons")
        })
        
        //awesome closure implied syntax....
//        group.notify(queue: DispatchQueue.main) {
//            print("Finished all requests.")
//
//            //delegate do xyz after downloading
//            self.delegate?.didDownload()
//            print("called delegate in downloadSeasons")
//        }
        
//        group.wait() //causes the main thread to pause -> could be used but needs to use another thread to do the work, or this will cause a deadlock on the main thread.
//        self.delegate?.didDownload()
//        print("called delegate in downloadSeasons")
    }
    
    func downloadEpisodeDetail() {
        for season in DataSource.myMainModel.seasons {
            guard let episodeList = season.episodes else{
                continue
            }
            for episode in episodeList {
                if let imdbId = episode.imdbID {
                    let url = episodeDetailUrlGoT + imdbId
//                    print("Episode Detail URL: \(url)")
                    downloadEndPoint(urlString: url, handler: {(serializedJson) in
                        if let serializedJson = serializedJson as? [String:Any] {
                            episode.episodeDetail = Parser.parseEpisodeDetail(input: serializedJson)
                            print("finished parseEpisodeDetail")
                        }
                    })
                }
            }
        }
    }
    
    //general url download
    func downloadEndPoint(urlString: String, handler: @escaping((Any)->Void)){
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
                    let serializedJson = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                        //Dispatch queue?
                        //print(serializedJson) //executed after main thread finishes?
                        DispatchQueue.main.async {
//                            print("Download Type: (downloadType), Serialized Json: \(serializedJson)") // runs on main thread?
                            handler(serializedJson)

                        }
                }
            } catch {
                print("error with JSONSerialization: \(error)")
            }
        })
        task.resume()
    }
}
