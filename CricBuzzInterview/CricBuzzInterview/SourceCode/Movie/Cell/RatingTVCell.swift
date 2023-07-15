//
//  RatingTVCell.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class RatingTVCell: UITableViewCell {

    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(at indexPath: IndexPath, ratingDataModel: MovieInfoDataModel.Rating) {
        ratingLbl.text = ratingDataModel.value ?? ""
        sourceLbl.text = ratingDataModel.source ?? ""
    }

}
