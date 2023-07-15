//
//  RatingDataSource.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class RatingDataSource: NSObject {
    var ratingList : [MovieInfoDataModel.Rating] = []
}

extension RatingDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTVCell", for: indexPath) as? RatingTVCell else {return UITableViewCell ()}
        cell.configCell(at: indexPath, ratingDataModel: ratingList[indexPath.row])
        return cell
    }
}

extension RatingDataSource: UITableViewDelegate {
    
}
