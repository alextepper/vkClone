//
//  PostTableViewCell.swift
//  FinalOne
//
//  Created by Alexander Tepper on 06/01/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var currentPost = Post(postId: "1", postPicture: UIImage(named: "1")!, postOwner: User(firstName: "Anton", lastName: "Golovin", username: "@antoha", profilePic: UIImage(named: "1")), postDate: Date())
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameButtonLabel: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var heartButtonLabel: UIButton!
    @IBOutlet weak var bookmarkButtonLabel: UIButton!
    @IBOutlet weak var secondUsernameButtonLabel: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        usernameButtonLabel.setTitle( "", for: .normal)
        secondUsernameButtonLabel.setTitle( "", for: .normal)
        postImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        // Initialization code
    }
    
    func configure(post: Post) {
        profileImageView.image = post.postOwner.profilePic
        usernameButtonLabel.setTitle(post.postOwner.username, for: .normal)
        secondUsernameButtonLabel.setTitle(post.postOwner.username, for: .normal)
        postImageView.image = post.postPicture
        currentPost = post
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
