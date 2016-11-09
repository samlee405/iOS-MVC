//
//  FriendTableViewCell.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

protocol FriendTableViewCellDelegate {
    func updateData(dataIndex: Int, mood: String)
}

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moodDescriptionLabel: UILabel!
    @IBOutlet weak var moodButton: UIButton!
    
    var index: Int?
    var delegate: FriendTableViewCellDelegate?


    @IBAction func didClickMoodButton(_ sender: AnyObject) {
        delegate?.updateData(dataIndex: index!, mood: (moodButton.titleLabel?.text)!)
    }
}
