//
//  ModalProfileViewController.swift
//  FinalOne
//
//  Created by Alexander Tepper on 09/01/2022.
//

import UIKit

class ModalProfileViewController: UIViewController {

    let reuseIdentifierUserPostsCollectionViewCell = "reuseIdentifierUserPostsCollectionViewCell"
    
    let modalProfileToPostSegue = "modalProfileToPostSegue"
    
    var postsSet: Set<String>?
    
    var user = User(firstName: "Anton", lastName: "Golovin", username: "@antoha", profilePic: UIImage(named: "1"))
    
    let margin: CGFloat = 2
    
    var posts: [Post] = [
        Post(postId: "1", postPicture: UIImage(named: "1")!, postOwner: User(firstName: "Anton", lastName: "Golovin", username: "@antoha", profilePic: UIImage(named: "1")), postDate: Date()),
        Post(postId: "2", postPicture: UIImage(named: "2")!, postOwner: User(firstName: "vovan", lastName: "Golovin", username: "@paren", profilePic: UIImage(named: "3")), postDate: Date()),
        Post(postId: "3", postPicture: UIImage(named: "3")!, postOwner: User(firstName: "mihal", lastName: "Golovin", username: "@misha", profilePic: UIImage(named: "2")), postDate: Date()),
        Post(postId: "4", postPicture: UIImage(named: "4")!, postOwner: User(firstName: "david", lastName: "Golovin", username: "@petya", profilePic: UIImage(named: "4")), postDate: Date())
    ]
    
    @IBOutlet weak var profileUserImageView: UIImageView!
    @IBOutlet weak var userPostsCollecttionView: UICollectionView!
    @IBOutlet weak var postCounter: UILabel!
    @IBOutlet weak var followersCounter: UILabel!
    @IBOutlet weak var followingCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = user.username
        profileUserImageView.image = user.profilePic
        postCounter.text = String(user.posts.count)
        followersCounter.text = String(user.followersIDs.count)
        followingCounter.text = String(user.followingIDs.count)
        
        
        userPostsCollecttionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierUserPostsCollectionViewCell)
        userPostsCollecttionView.dataSource = self
        userPostsCollecttionView.delegate = self
        profileUserImageView.layer.cornerRadius = profileUserImageView.frame.width/2
        
    }
    
    private func findPosts(posts: Set<String>) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == modalProfileToPostSegue,
//           let sourceVC = segue.source as? FeedViewController,
           let destinationVC = segue.destination as? PostViewController,
           let postSender = sender as? Post {
            destinationVC.post = postSender.self
        }

    }
    
    
    
}
extension ModalProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierUserPostsCollectionViewCell, for: indexPath) as? PostCollectionViewCell else {return UICollectionViewCell()}
        
        cell.configure(post: posts[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = collectionView.frame.width/3 - margin
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: modalProfileToPostSegue, sender: posts[indexPath.item])
    }
    
}

