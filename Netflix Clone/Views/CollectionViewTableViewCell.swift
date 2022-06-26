//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by miadjalili on 6/14/22.
//

import UIKit


protocol CollectionViewTableViewCellDelegate : AnyObject {
    func CollectionViewTableViewCellDidTapCell(_ cell:CollectionViewTableViewCell, viewModel: TitlePreviewViewModel )
}

class CollectionViewTableViewCell: UITableViewCell {

   static let identifier = "CollectionViewTableViewCell"
    
    weak var delegate : CollectionViewTableViewCellDelegate?

    private var titles: [Title] = [Title]()
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    
    public func configure ( with titles: [Title]){
        self.titles = titles
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}


extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {return UICollectionViewCell()}
        cell.configuration(with: titles[indexPath.row].posterPath, vote: Double(titles[indexPath.row].voteAverage))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let title = titles[indexPath.row]
        guard let titleName = title.originalTitle ?? title.originalName else {
            return
        }
        
        APICaller.shared.getMovie(with: titleName + " trailer") { [weak self] result in
            switch result {
            case .success(let item):
                guard let titleOverview = title.overview else {return}
                guard let strongSelf = self else {return}
                let viewModel = TitlePreviewViewModel(title: titleName , youtubeView: item, titleOverview: titleOverview)
                self?.delegate?.CollectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
