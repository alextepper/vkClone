//
//  FriendsViewController.swift
//  FinalOne
//
//  Created by Alexander Tepper on 03/01/2022.
//

import UIKit

class FriendsViewController: UIViewController {

    let reuseIdentifierFriendsTableViewCell = "reuseIdentifierFriendsTableViewCell"
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    let friendsToProfileSegue = "friendsToProfileSegue"
    
    var users = [User]()
    
    private func fillData() {
        for user in usersData {
            users.append(user)
        }
    }
                              
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        friendsTableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierFriendsTableViewCell)
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == friendsToProfileSegue,
//           let sourceVC = segue.source as? FeedViewController,
           let destinationVC = segue.destination as? ModalProfileViewController,
           let postSender = sender as? User {
            destinationVC.user = postSender.self
        }

    }
    
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: reuseIdentifierFriendsTableViewCell, for: indexPath) as? FriendTableViewCell else {return UITableViewCell()}
        
        cell.configure(user: users[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: friendsToProfileSegue, sender: users[indexPath.row])
    }
}
