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
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.label.cgColor
        button.setTitleColor(UIColor.label, for: .normal)
        button.titleLabel?.textColor = .label
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
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
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(titlePosterUIImageViewConstraint)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
