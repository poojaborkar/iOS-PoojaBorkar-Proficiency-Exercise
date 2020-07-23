//
//  CustomTableViewCell.swift
//  Exercise

import UIKit
import AlamofireImage

class CustomTableViewCell: UITableViewCell {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private var imgView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(imgView)
        
        imgView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 80, height: 80, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: imgView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: imgView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 20, width: 0, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: TableViewRowUIModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
        if let imageUrl = model.imageUrl {
            if let imageURL = URL(string: imageUrl), let placeholder = UIImage(named: "default_Image") {
                imgView.af_setImage(withURL: imageURL, placeholderImage: placeholder)
            }
        } else {
            imgView.image = UIImage(named: "default_Image")
        }
    }
}
