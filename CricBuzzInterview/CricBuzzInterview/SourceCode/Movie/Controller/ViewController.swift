//
//  ViewController.swift
//  CricBuzzInterview
//
//  Created by Ankit Tiwari on 15/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!  {
        didSet {
            tblView.dataSource = dataSource
            tblView.delegate = dataSource
        }
    }
    @IBOutlet weak var searchTxtField: UITextField! {
        didSet {
            searchTxtField.delegate = self
        }
    }
    let viewModel = MovieInfoViewModel()
    let dataSource = MovieInfoDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 43, width: width, height: 75))
        self.view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Movies")
//        let doneBtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popToController))
//        navigationItem.leftBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
    }
    
    @objc func popToController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func initialSetup() {
        dataSource.controller = self
        dataSource.dataModelList = viewModel.dataModel
        registerCell()
    }
    
    private func registerCell() {
        tblView.register(UINib(nibName: "MovieGenreTVCell",
                               bundle: nil),
                         forCellReuseIdentifier: "MovieGenreTVCell")
        tblView.register(UINib(nibName: "MovieInfoTVCell",
                               bundle: nil),
                         forCellReuseIdentifier: "MovieInfoTVCell")
    }
    
    
    @IBAction func textFieldEditingWillChanged(_ sender: UITextField) {
        if sender.text == "" {
            dataSource.isDataFromSearchList = false
        } else {
            dataSource.isDataFromSearchList = true
            dataSource.searchDataList  = viewModel.dataModel.listForSearch(sender.text ?? "")
        }
        
        tblView.reloadData()
    }
    
    @IBAction func onClickCrossBtn(_ sender: UIButton) {
        searchTxtField.text = ""
        dataSource.isDataFromSearchList = false
        tblView.reloadData()
    }
}

extension ViewController: UITextFieldDelegate {}
