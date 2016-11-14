//
//  AddFriendViewController.swift
//  MoodTracker-starter
//
//  Created by Sam Lee on 11/9/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

protocol AddFriendViewControllerDelegate {
    func addFriend(name: String, mood: Mood)
}

class AddFriendViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moodSegmentedController: UISegmentedControl!
    
    var delegate: AddFriendViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFriendButtonPressed(_ sender: AnyObject) {
        if nameTextField.text != "" {
            if moodSegmentedController.selectedSegmentIndex == 0 {
                delegate?.addFriend(name: nameTextField.text!, mood: .happy)
            }
            else if moodSegmentedController.selectedSegmentIndex == 1 {
                delegate?.addFriend(name: nameTextField.text!, mood: .normal)
            }
            else if moodSegmentedController.selectedSegmentIndex == 2 {
                delegate?.addFriend(name: nameTextField.text!, mood: .angry)
            }
            self.performSegue(withIdentifier: "UnwindToFriendsTableViewController", sender: self)
        }
        else {
            print("Please enter a name")
        }
    }
}
