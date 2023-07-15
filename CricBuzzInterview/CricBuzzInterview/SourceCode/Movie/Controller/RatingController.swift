//
//  RatingController.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class RatingController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.dataSource = dataSource
            tblView.delegate = dataSource
        }
    }
    let dataSource = RatingDataSource()
    var ratingList = [MovieInfoDataModel.Rating]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        dataSource.ratingList = ratingList
        addTapGesture()
    }

    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(_:)))
        contentView.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapGestureHandler(_ tapGesture: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
}

