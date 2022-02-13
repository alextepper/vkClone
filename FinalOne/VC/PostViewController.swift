//
//  PostViewController.swift
//  FinalOne
//
//  Created by Alexander Tepper on 08/01/2022.
//

import UIKit



class PostViewController: UIViewController {
    
    let reuseIdentifierPostTableViewCell = "reuseIdentifierPostTableViewCell"
    
    let postToProfileSegue = "postToProfileSegue"
    
    var post = Post(postId: "1", postPicture: UIImage(named: "2")!, postOwner: User(firstName: "Anton", lastName: "Golovin", username: "@antoha", profilePic: UIImage(named: "1")), postDate: Date())
    
    @IBOutlet weak var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierPostTableViewCell)
        postsTableView.dataSource = self
        postsTableView.delegate = self
    }
    

    
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = postsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierPostTableViewCell, for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
        
        cell.configure(post: post)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140 + view.frame.size.width
    }
    
}
