//
//  GenreDataSource.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class GenreDataSource: NSObject {
    lazy var genreList = [MovieInfoDataModel]()
    lazy var genreTypeList = [String]()
    weak var controller: GenreController?
    
    private func generType() -> [String] {
        if !genreList.generTypeList("action").isEmpty {
            genreTypeList.append("Action")
        }
        if !genreList.generTypeList("comedy").isEmpty {
            genreTypeList.append("Comedy")
        }
        if !genreList.generTypeList("sport").isEmpty {
            genreTypeList.append("Sport")
        }
        
        if !genreList.generTypeList("crime").isEmpty {
            genreTypeList.append("Crime")
        }
        if !genreList.generTypeList("drama").isEmpty {
            genreTypeList.append("Drama")
        }
        
        if !genreList.generTypeList("western").isEmpty {
            genreTypeList.append("Western")
        }
        
        if !genreList.generTypeList("sci-fi").isEmpty {
            genreTypeList.append("Sci-Fi")
        }
        
        if !genreList.generTypeList("thriller").isEmpty {
            genreTypeList.append("Thriller")
        }
        
        if !genreList.generTypeList("family").isEmpty {
            genreTypeList.append("Family")
        }
        
        if !genreList.generTypeList("fantasy").isEmpty {
            genreTypeList.append("Fantasy")
        }
        
        if !genreList.generTypeList("animation").isEmpty {
            genreTypeList.append("Animation")
        }
        
        if !genreList.generTypeList("documentary").isEmpty {
            genreTypeList.append("Documentary")
        }
        
        if !genreList.generTypeList("romance").isEmpty {
            genreTypeList.append("Romance")
        }
        
        if !genreList.generTypeList("biography").isEmpty {
            genreTypeList.append("Biography")
        }
        
        if !genreList.generTypeList("history").isEmpty {
            genreTypeList.append("History")
        }
        if !genreList.generTypeList("war").isEmpty {
            genreTypeList.append("War")
        }
        
        return genreTypeList
    }
}

extension GenreDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generType().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieGenreTVCell", for: indexPath) as? MovieGenreTVCell else {
            return UITableViewCell()
        }
        cell.configCell(at: indexPath, genreTypeList[indexPath.row])
        tableView.allowsSelection = true
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension GenreDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MovieGenreTVCell else {return}
        GenreType[cell.genreLbl.text ?? ""].didUserSelectGnreType(with: genreList,  controller ?? UIViewController())
    }
}
