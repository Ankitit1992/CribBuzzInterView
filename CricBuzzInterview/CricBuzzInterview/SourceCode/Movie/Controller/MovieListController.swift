//
//  MovieListController.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class MovieListController: UIViewController {

    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.dataSource = dataSource
            tblView.delegate = dataSource
        }
    }
    lazy var generList = [MovieInfoDataModel]()
    let dataSource = MovieListDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
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
    
    private func initialSetup() {
        dataSource.controller = self
        dataSource.genreList = generList
        registerCell()
    }
    
    private func registerCell() {
        tblView.register(UINib(nibName: "MovieGenreTVCell",
                               bundle: nil),
                         forCellReuseIdentifier: "MovieGenreTVCell")
    }
}
