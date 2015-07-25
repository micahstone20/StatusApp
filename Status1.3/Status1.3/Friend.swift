//
//  Friend.swift
//  Status1.3
//
//  Created by Larus on 7/25/15.
//  Copyright (c) 2015 LarusStone. All rights reserved.
//
// Information about one person.
//

import Foundation
import Swift

enum Status {
    case Busy, Free
}

class Friend {
    // MARK: Properties
    var name: String
    var status: Status
    var whatsDoing: String?
    var isOnline: Bool
    
    init(name: String, status: Status = .Free, whatsDoing: String? = nil, isOnline: Bool = false) {
        self.name = name
        self.status = status
        self.whatsDoing = whatsDoing
        self.isOnline = isOnline
    }
}

extension Friend: Equatable {}

func ==(lhs: Friend, rhs: Friend) -> Bool {
    return lhs.name == rhs.name
}