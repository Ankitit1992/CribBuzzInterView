//
//  GenreController.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class GenreController: UIViewController {

    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.dataSource = dataSource
            tblView.delegate = dataSource
        }
    }
    
    let dataSource = GenreDataSource()
    lazy var genreList = [MovieInfoDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
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
    
    private func initalSetup() {
        dataSource.genreList = genreList
        dataSource.controller = self
        registerCell()
    }
    
    private func registerCell() {
        tblView.register(UINib(nibName: "MovieGenreTVCell",
                               bundle: nil),
                         forCellReuseIdentifier: "MovieGenreTVCell")
        
    }
}

extension Array where Element == MovieInfoDataModel {
    func generTypeList(_ string: String) -> [MovieInfoDataModel] {
        self.filter {($0.genre ?? "").lowercased().contains(string)}
    }
    
    func listForSearch(_ text: String) -> [MovieInfoDataModel] {
        self.filter {($0.genre ?? "").lowercased().contains(text.lowercased()) || ($0.year ?? "").contains(text) || ($0.actors ?? "").lowercased().contains(text.lowercased()) || ($0.director ?? "").lowercased().contains(text.lowercased())}
    }
}
