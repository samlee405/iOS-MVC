//
//  FriendsTableViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, FriendTableViewCellDelegate, AddFriendViewControllerDelegate {
    
    var friendArray = [
        Friend(name: "Jonathan", mood: .angry),
        Friend(name: "Johnny", mood: .happy),
        Friend(name: "John", mood: .normal)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateData(dataIndex: Int, mood: String) {
        switch mood {
        case "😂": friendArray[dataIndex].mood = .normal
        case "😐": friendArray[dataIndex].mood = .angry
        case "😡": friendArray[dataIndex].mood = .happy
        default: break
        }
        
        self.tableView.reloadData()
    }
    
    func addFriend(name: String, mood: Mood) {
        friendArray.append(Friend(name: name, mood: mood))
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
        
        cell.delegate = self
        cell.index = indexPath.row
        cell.nameLabel.text = friendArray[indexPath.row].name
        cell.moodButton.setTitle(friendArray[indexPath.row].mood.rawValue, for: .normal)
        
        switch friendArray[indexPath.row].mood {
            case .happy: cell.moodDescriptionLabel.text = "Ay, what's good"
            case .normal: cell.moodDescriptionLabel.text = "Hey"
            case .angry: cell.moodDescriptionLabel.text = "Get off my back"
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddFriendViewController
        destination.delegate = self
    }
    
    @IBAction func unwindToFriendsTableViewController(segue: UIStoryboardSegue) {
    }
}
