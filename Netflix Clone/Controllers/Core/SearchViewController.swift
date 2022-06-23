//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by miadjalili on 6/14/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var titles: [Title] = [Title]()
    
    private let discoverTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    
    private let searchController: UISearchController = {
        let Controller = UISearchController(searchResultsController: SearchResultsViewController())
        Controller.searchBar.placeholder = "Search for a Movie or a Tv show"
        Controller.searchBar.searchBarStyle = .minimal
        return Controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
        navigationItem.searchController = searchController
        navigationController?.navigationBar.tintColor = .label
        
        fetchDiscoverMovies()
        
        searchController.searchResultsUpdater = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    
    private func fetchDiscoverMovies(){
        
        APICaller.shared.getDiscoversMovies { [weak self]result in
            switch result{
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.discoverTable.reloadData()
                }
                
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
    

extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {return UITableViewCell()}
        
        let title = titles[indexPath.row]
        cell.configuration(with: TitleViewModel(titleName: title.originalName ?? title.originalTitle ?? "unknown", posterUrl: title.posterPath ?? "" ))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
}



extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty ,
              query.trimmingCharacters(in: .whitespaces).count  >= 3,
              let resultController  = searchController.searchResultsController as? SearchResultsViewController else {
            return
            
        }
        
        
        APICaller.shared.search(with: query) { result in
            
            DispatchQueue.main.async {
                switch result{
                case .success(let titles):
                    resultController.titles = titles
                    resultController.searchResultsCollectionView.reloadData()
                case.failure(let error):
                    print(error.localizedDescription)
                    
                }
                
            }
        }
    }
    
    
    
}
