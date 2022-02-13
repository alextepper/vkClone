//
//  PostCollectionViewCell.swift
//  FinalOne
//
//  Created by Alexander Tepper on 06/01/2022.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        // Initialization code
    }
    
    override func prepareForReuse() {
        postImageView.image = nil
    }
    
    func configure(post: Post) {
        postImageView.image = post.postPicture
    }
    

}
