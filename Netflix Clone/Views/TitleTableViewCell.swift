//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Miad Jalili on 21.06.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image,for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let titlePosterUIImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraint()
    }
    
    private func applyConstraint(){
        let titlePosterUIImageViewConstraint = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
  let titleLabelConstraint = [
    titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor , constant:  20),
    titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
  ]
        
        let playButtonConstraint = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant:  -20), playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePosterUIImageViewConstraint)
        NSLayoutConstraint.activate(titleLabelConstraint)
        NSLayoutConstraint.activate(playButtonConstraint)
    }
    
    
    public func configuration(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {return}
        titlePosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
   
   
}
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    

}
