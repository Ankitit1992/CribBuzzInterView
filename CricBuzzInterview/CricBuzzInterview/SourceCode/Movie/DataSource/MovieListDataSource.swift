//
//  MovieListDataSource.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class MovieListDataSource: NSObject {
    lazy var genreList = [MovieInfoDataModel]()
    weak var controller: MovieListController?
}
 
extension MovieListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        genreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieGenreTVCell", for: indexPath) as? MovieGenreTVCell else {
            return UITableViewCell()
        }
        cell.configCell(at: indexPath, genreList[indexPath.row].title ?? "")
        tableView.allowsSelection = true
        cell.selectionStyle = .none
        return cell
    }
}

extension MovieListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movetoMovieDetailsCOntroller(at: indexPath)
    }
    
    private func movetoMovieDetailsCOntroller(at indexPath: IndexPath) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsController") as? MovieDetailsController else {return}
        vc.dataModel = genreList[indexPath.row]
        controller?.navigationController?.pushViewController(vc, animated: true)
    }
}
