//
//  Cohort.swift
//  Status1.3
//
//  Created by Larus on 7/25/15.
//  Copyright (c) 2015 LarusStone. All rights reserved.
//
// Information about a group of Friends.
//

import Foundation

class Cohort {
    // MARK: Properties
    var title: String;
    var friends: [Friend];
    
    init(title: String) {
        self.title = title;
        friends = [Friend]();
    }
    
    func getFriend(i: Int) -> Friend {
        return friends[i]
    }
    
    func count() -> Int {
        return friends.count;
    }
    
    func countOnline() -> Int {
        return friends.filter({$0.isOnline}).count
    }
    
    func addFriend(friend: Friend) -> Bool {
        if !contains(friends, friend) {
            friends.append(friend)
            return true
        }
        return false
    }
    
    func addFriend(friend: Friend, index: Int) -> Bool {
        if !contains(friends, friend) {
            friends.insert(friend, atIndex: index)
            return true
        }
        return false
    }
    
    func dropFriend(index: Int) -> Friend {
        return friends.removeAtIndex(index)
    }
}

extension Cohort: Equatable {}

func ==(lhs: Cohort, rhs: Cohort) -> Bool {
    return lhs.title == rhs.title
}