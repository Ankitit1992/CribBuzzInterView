//
//  MovieGenreTVCell.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class MovieGenreTVCell: UITableViewCell {

    @IBOutlet weak var genreLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(at indexPath: IndexPath, _ name: String) {
        genreLbl.text = name
    }
    
}

 enum MovieType: Int {
    case year = 0
    case genre
    case director
    case actor
    case none
    
    static subscript(_ value: Int) -> MovieType {
        MovieType(rawValue: value) ?? .none
    }
    
     func didUserSelectCell(at dataModelList: [MovieInfoDataModel], _ controller: UIViewController) {
         guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GenreController") as? GenreController else {return}
         vc.genreList = dataModelList
         controller.navigationController?.pushViewController(vc, animated: true)
     }
}


enum GenreType: String {
    case action = "Action"
    case comedy = "Comedy"
    case sport = "Sport"
    case crime = "Crime"
    case drama = "Drama"
    case western = "Western"
    case familys = "Family"
    case fantasy = "Fantasy"
    case adventure = "Adventure"
    case thriller = "Thriller"
    case scifi = "Sci-Fi"
    case animations = "Animation"
    case documentary = "Documentary"
    case romance = "Romance"
    case biography = "Biography"
    case history = "History"
    case war = "War"
    case none
    
    static subscript(_ value: String) -> GenreType {
        GenreType(rawValue: value) ?? .none
    }
    
    func didUserSelectGnreType(with dataModelList: [MovieInfoDataModel], _ controller: UIViewController) {
        switch self {
        case .biography:
            moveToController(with:  dataModelList.generTypeList("biography"), controller)
        case .history:
            moveToController(with:  dataModelList.generTypeList("history"), controller)
        case .war:
            moveToController(with:  dataModelList.generTypeList("war"), controller)
        case .action:
            moveToController(with: dataModelList.generTypeList("action"), controller)
        case .comedy:
            moveToController(with: dataModelList.generTypeList("comedy"), controller)
        case .sport:
            moveToController(with: dataModelList.generTypeList("sport"), controller)
        case .crime:
            moveToController(with: dataModelList.generTypeList("crime"), controller)
        case .drama:
            moveToController(with: dataModelList.generTypeList("drama"), controller)
        case .western:
            moveToController(with: dataModelList.generTypeList("western"), controller)
        case .familys:
            moveToController(with: dataModelList.generTypeList("family"), controller)
        case .thriller:
            moveToController(with: dataModelList.generTypeList("thriller"), controller)
        case .fantasy:
            moveToController(with: dataModelList.generTypeList("fantasy"), controller)
        case .adventure:
            moveToController(with: dataModelList.generTypeList("adventure"), controller)
        case .scifi:
            moveToController(with: dataModelList.generTypeList("sci-fi"), controller)
        case .animations:
            moveToController(with: dataModelList.generTypeList("animation"), controller)
        case .documentary:
            moveToController(with: dataModelList.generTypeList("documentary"), controller)
        case .romance:
            moveToController(with: dataModelList.generTypeList("romance"), controller)
        default:
            return
        }
    }
    
    private func moveToController(with list: [MovieInfoDataModel], _ controller: UIViewController) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListController") as? MovieListController else {return}
        vc.generList = list
        controller.navigationController?.pushViewController(vc, animated: true)
    }
}
