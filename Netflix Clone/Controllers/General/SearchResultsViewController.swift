//
//  SearchResultsViewController.swift
//  Netflix Clone
//
//  Created by Miad Jalili on 23.06.2022.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    public var titles: [Title] = [Title]()
    
    
    public let searchResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10 , height: 200)
        layout.minimumInteritemSpacing = 0 
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collection
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
        view.addSubview(searchResultsCollectionView)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
    


}


extension SearchResultsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as?  TitleCollectionViewCell else {return UICollectionViewCell()
        }
        let title = titles[indexPath.row]
        cell.configuration(with: title.posterPath ?? "", vote: Double(title.voteAverage) )

        return cell
    }
    
    
}
