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
    
    func getFriends(i: Int) -> Friend {
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
    
    func dropFriend(friend: Friend) -> Bool {
        for i in 0..<friends.count {
            if friends[i] == friend {
                friends.removeAtIndex(i)
                return true
            }
        }
        return false
    }
}

extension Cohort: Equatable {}

func ==(lhs: Cohort, rhs: Cohort) -> Bool {
    return lhs.title == rhs.title
}