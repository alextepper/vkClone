//
//  FeedViewController.swift
//  FinalOne
//
//  Created by Alexander Tepper on 06/01/2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let reuseIdentifierFeedCollectionViewCell = "reuseIdentifierFeedCollectionViewCell"
    
    let margin: CGFloat = 2
    let feedToPostSegue = "feedToPostSegue"


    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    
    var posts: [Post] = [
        Post(postId: "1", postPicture: UIImage(named: "1")!, postOwner: User(firstName: "Anton", lastName: "Golovin", username: "@antoha", profilePic: UIImage(named: "1")), postDate: Date()),
        Post(postId: "2", postPicture: UIImage(named: "2")!, postOwner: User(firstName: "vovan", lastName: "Golovin", username: "@paren", profilePic: UIImage(named: "3")), postDate: Date()),
        Post(postId: "3", postPicture: UIImage(named: "3")!, postOwner: User(firstName: "mihal", lastName: "Golovin", username: "@misha", profilePic: UIImage(named: "2")), postDate: Date()),
        Post(postId: "4", postPicture: UIImage(named: "4")!, postOwner: User(firstName: "david", lastName: "Golovin", username: "@petya", profilePic: UIImage(named: "4")), postDate: Date())
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierFeedCollectionViewCell)
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == feedToPostSegue,
//           let sourceVC = segue.source as? FeedViewController,
           let destinationVC = segue.destination as? PostViewController,
           let postSender = sender as? Post {
            destinationVC.post = postSender.self
        }

    }
    
}
extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierFeedCollectionViewCell, for: indexPath) as? PostCollectionViewCell else {return UICollectionViewCell()}
        
        cell.configure(post: posts[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = collectionView.frame.width/3 - margin
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: feedToPostSegue, sender: posts[indexPath.item])
    }
    
}
