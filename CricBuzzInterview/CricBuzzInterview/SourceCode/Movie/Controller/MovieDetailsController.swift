//
//  MovieDetailsController.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class MovieDetailsController: UIViewController {

    var dataModel: MovieInfoDataModel?
    
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 43, width: width, height: 75))
        self.view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Movies")
        let doneBtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popToController))
        navigationItem.leftBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
    }
    
    @objc func popToController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func intialSetup() {
        registerCell()
        
    }
    
    private func registerCell() {
        tblView.register(UINib(nibName: "MovieDetailsTVCell",
                               bundle: nil),
                         forCellReuseIdentifier: "MovieDetailsTVCell")
    }
}

extension MovieDetailsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailsTVCell", for: indexPath) as? MovieDetailsTVCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        guard let dataModel = dataModel else {return UITableViewCell()}
        cell.configCell(at: indexPath, dataModel)
        return cell
    }
}

extension MovieDetailsController: MoviesRatingDetailsDelegate {
    func didUserSelectRating(_ dataModel: MovieInfoDataModel) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RatingController") as? RatingController else {return}
        self.modalPresentationStyle = .overCurrentContext
        controller.ratingList = dataModel.ratings ?? []
        self.present(controller, animated: true)
    }
}
