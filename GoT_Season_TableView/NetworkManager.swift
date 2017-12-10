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
    
    func seasonAndEpisode(urlString: String){
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
//                        print(serializedJson)
//                        let totalSeasons = serializedJson["totalSeasons"]
                        let main = Parser.parseMain(input: serializedJson)
                        print(main.totalSeasons)
                        //parsing to your models...
                    
                    //delegate do xyz after downloading
                    self.delegate?.didDownload()
                    }
                }
            } catch {
                print("error with JSONSerialization: \(error)")
            }
        })
        task.resume()
    }
}
