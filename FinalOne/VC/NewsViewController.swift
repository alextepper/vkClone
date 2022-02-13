//
//  NewsViewController.swift
//  FinalOne
//
//  Created by Alexander Tepper on 06/01/2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    let reuseIdentifierPostsTableViewCell = "reuseIdentifierPostsTableViewCell"
    
    let post1 = Post(postId: "1", postPicture: UIImage(named: "2")!, postOwner: User(firstName: "Anton", lastName: "Golovin", username: "antoha", profilePic: UIImage(named: "1")), postDate: Date())
    
    @IBOutlet weak var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierPostsTableViewCell)
        postsTableView.dataSource = self
        postsTableView.delegate = self
    }
    

    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = postsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierPostsTableViewCell, for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
        
        cell.configure(post: post1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140 + view.frame.size.width
    }
}
