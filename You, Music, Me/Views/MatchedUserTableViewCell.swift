//
//  MatchedUserTableViewCell.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 2/8/22.
//

import Foundation
import UIKit

class MatchedUserTableViewCell: UITableViewCell {
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit // image will not be stretch horizontally or vertically
        image.translatesAutoresizingMaskIntoConstraints = false // enable auto layout
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemCyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let matchedUserFavoriteArtistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .systemCyan
        label.backgroundColor = .systemGray
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // The main reason for containerView is to add both labels to it and to center them vertically against the content view of the cell.
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let chatImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 13
        image.clipsToBounds = true
        //image.image = UIImage(systemName: "chevron.right")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // All the views should be added inside the contentView which is the top-level view in this class
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(matchedUserFavoriteArtistLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(chatImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
