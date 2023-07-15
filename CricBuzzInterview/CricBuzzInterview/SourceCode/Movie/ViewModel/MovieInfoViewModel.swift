//
//  MovieInfoViewModel.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import Foundation

class MovieInfoViewModel: NSObject {
    
    var dataModel: [MovieInfoDataModel] = []
    
    override init() {
        super.init()
        self.dataFromMovieJsobn()
    }
    
    func dataFromMovieJsobn() {
        guard let data = movieJson.data(using: .utf8) else {return}
        do {
            let dataModel = try JSONDecoder().decode([MovieInfoDataModel].self, from: data)
            self.dataModel = dataModel
        } catch {
            print("data not found")
        }
    }
    
}
