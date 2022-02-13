//
//  FriendTableViewCell.swift
//  FinalOne
//
//  Created by Alexander Tepper on 03/01/2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var followButtonOutlet: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
    }
    
    func configure(name: String?, username: String?) {
        nameLabel.text = name
        usernameLabel.text = username
    }
    
    func configure(user: User) {
        nameLabel.text = user.firstName + " " + user.lastName
        usernameLabel.text = user.username
        if user.profilePic != nil {
            userProfilePic.image = user.profilePic
        } else {
            return
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userProfilePic.layer.cornerRadius = userProfilePic.frame.width/2
        // Initialization code
    }

    
    @IBAction func pressedFollowButton(_ sender: Any) {
    }
    
}
