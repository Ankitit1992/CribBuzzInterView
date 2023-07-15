//
//  MovieDetailsTVCell.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

protocol MoviesRatingDetailsDelegate: AnyObject {
    func didUserSelectRating(_ dataModel: MovieInfoDataModel)
}

class MovieDetailsTVCell: UITableViewCell {

    @IBOutlet weak var writerLbl: UILabel!
    @IBOutlet weak var actorsLbl: UILabel!
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var releaseDatelbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var plotLbl: UILabel!
    weak var delegate: MoviesRatingDetailsDelegate?
    var dataModel: MovieInfoDataModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(at indexPath: IndexPath, _ dataModel: MovieInfoDataModel) {
        self.dataModel = dataModel
        genreLbl.text = dataModel.genre ?? ""
        releaseDatelbl.text = dataModel.released ?? ""
        titleLbl.text = dataModel.title ?? ""
        directorLbl.text = "Director: " + (dataModel.director ?? "")
        actorsLbl.text = "Actors: " + (dataModel.actors ?? "")
        writerLbl.text = "Writer: " + (dataModel.writer ?? "")
        plotLbl.text = "Plot: " + (dataModel.plot ?? "")
        (dataModel.poster ?? "").fetchImage {[weak self] img in
            guard let self = self else {return}
            self.posterImgView.image = img
        }
    }
    
    @IBAction func onClickRatingBtn(_ sender: UIButton) {
        guard let dataModel = dataModel else {return}
        self.delegate?.didUserSelectRating(dataModel)
    }
    
}
