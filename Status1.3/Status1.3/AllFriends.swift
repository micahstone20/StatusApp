//
//  AllFriends.swift
//  Status1.3
//
//  Created by Larus on 7/25/15.
//  Copyright (c) 2015 LarusStone. All rights reserved.
//

import Foundation

class AllFriends {
    // MARK: Properties
    var cohorts: [Cohort]
    
    init() {
        cohorts = [Cohort]()
    }
    
    func count() -> Int {
        return cohorts.count
    }
    
    func getCohort(i: Int) -> Cohort {
        return cohorts[i]
    }
    
    func addCohort(cohort: Cohort) -> Bool {
        if !contains(cohorts, cohort) {
            cohorts.append(cohort)
            return true
        }
        return false
    }
    
    func dropCohort(cohort: Cohort) -> Bool {
        for i in 0..<cohorts.count {
            if cohorts[i] == cohort {
                cohorts.removeAtIndex(i)
                return true
            }
        }
        return false
    }
}