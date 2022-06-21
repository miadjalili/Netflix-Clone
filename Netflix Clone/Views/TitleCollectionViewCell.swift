//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Miad Jalili on 20.06.2022.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let budget: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 15
        label.backgroundColor = .systemRed
        label.textAlignment = .center
        label.textColor = .label
        label.clipsToBounds = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        posterImageView.addSubview(budget)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
        NSLayoutConstraint.activate([
            budget.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
            budget.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            budget.heightAnchor.constraint(equalToConstant: 30),
            budget.widthAnchor.constraint(greaterThanOrEqualToConstant: 30)])
    }
    
    
    public func configuration(with model: String, vote: Double) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        posterImageView.sd_setImage(with: url, completed: nil)
        budget.text = String("\(vote)")
   
}
}
