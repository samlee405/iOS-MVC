//
//  Friend.swift
//  MoodTracker-starter
//
//  Created by Sam Lee on 11/4/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

class Friend {
    let name: String
    var mood: Mood
    
    init(name: String, mood: Mood) {
        self.name = name
        self.mood = mood
    }
}
