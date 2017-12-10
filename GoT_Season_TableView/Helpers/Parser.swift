//
//  Parser.swift
//  GoT_Season_TableView
//
//  Created by mobile consulting on 12/9/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

class Parser {
    static func parseMain(input: [String:Any]) -> Main {
        let main = Main(context: CoreDataManager().getContext())
        if let totalSeasons = input[GameOfThronesAPI.Main.totalSeason] as? String {
            if let numbTotalSeasons = Int64(totalSeasons) {
                main.totalSeasons = numbTotalSeasons
            }
        }
        return main
    }
}
