//
//  MovieInfoTVCell.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class MovieInfoTVCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = UIImage(named: "photo")
    }
    
    func configCell(at indexPath: IndexPath, dataModel: MovieInfoDataModel) {
        (dataModel.poster ?? "").fetchImage {[weak self] img in
            guard let self = self else {return}
            self.imgView.image = img
        }
        
        languageLbl.text = dataModel.language ?? ""
        titleLbl.text = dataModel.title ?? ""
        dateLbl.text = dataModel.released ?? ""
    }
}

extension String {
    func fetchImage(_ completionHandler: @escaping (UIImage) -> Void) {
        guard let url = URL(string: self) else {return}
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                completionHandler(image)
            }
            
        }.resume()
    }
}
