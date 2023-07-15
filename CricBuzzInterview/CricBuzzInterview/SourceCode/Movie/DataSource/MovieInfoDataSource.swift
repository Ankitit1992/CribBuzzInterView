//
//  MovieInfoDataSource.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class MovieInfoDataSource: NSObject {
    var dataModelList = [MovieInfoDataModel]()
    var isDataFromSearchList = false
    var searchDataList =  [MovieInfoDataModel]()
    weak var controller: ViewController?
}

extension MovieInfoDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isDataFromSearchList ? searchDataList.count : 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        isDataFromSearchList ? getMovieInfoCell(tableView, at: indexPath) : getGenreTVCell(tableView, at: indexPath)
    }
    
    func getMovieInfoCell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoTVCell", for: indexPath) as? MovieInfoTVCell else {
            return UITableViewCell()
        }
        cell.configCell(at: indexPath, dataModel: searchDataList[indexPath.row])
        tableView.allowsSelection = true
        cell.selectionStyle = .none
        return cell
    }
    
    func getGenreTVCell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieGenreTVCell", for: indexPath) as? MovieGenreTVCell else {
            return UITableViewCell()
        }
        cell.configCell(at: indexPath, MovieInfoConstant.MovieTypeList[indexPath.row])
        tableView.allowsSelection = true
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MovieInfoDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  !isDataFromSearchList {
//            let list = dataModelList.filter {((($0.genre ?? "" ).lowercased()).contains("actor")) || (($0.genre ?? "" ).lowercased().contains("sport"))  || (($0.genre ?? "" ).lowercased().contains("comedy")) }

            MovieType[indexPath.row].didUserSelectCell(at: dataModelList, controller ?? UIViewController())
        }
        
        if isDataFromSearchList {
            movetoMovieDetailsCOntroller(at: indexPath)
        }
    }
    
    private func movetoMovieDetailsCOntroller(at indexPath: IndexPath) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsController") as? MovieDetailsController else {return}
        vc.dataModel = searchDataList[indexPath.row]
        controller?.navigationController?.pushViewController(vc, animated: true)
    }
}

struct MovieInfoConstant {
    static let MovieTypeList = ["Year", "Genre", "Directors", "Actors"]
}
