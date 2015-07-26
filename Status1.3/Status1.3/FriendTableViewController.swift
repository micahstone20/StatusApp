//
//  FriendTableViewController.swift
//  Status1.3
//
//  Created by Larus on 7/25/15.
//  Copyright (c) 2015 LarusStone. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    //******
    // Dummy DB for development
    //
    var friends: AllFriends = AllFriends()
    
    func loadSampleFriends() {
        if friends.count() == 0 {
        var cohort = Cohort(title: "Family")
        cohort.addFriend(Friend(name: "Dad", status: .Busy, whatsDoing: "coding, what else?", isOnline: true))
        cohort.addFriend(Friend(name: "Mom", status: .Free, whatsDoing: "blogging"))
        cohort.addFriend(Friend(name: "Jeremy", status: .Busy, whatsDoing: "flying"))
        cohort.addFriend(Friend(name: "Micah", status: .Free, whatsDoing: "working", isOnline: true))
        cohort.addFriend(Friend(name: "Nicholas", status: .Busy, whatsDoing: "cooking", isOnline: true))
        cohort.addFriend(Friend(name: "Gabi", status: .Busy, whatsDoing: "working", isOnline: true))
        friends.addCohort(cohort)
        
        cohort = Cohort(title: "SF friends")
        cohort.addFriend(Friend(name: "John K", status: .Busy, whatsDoing: "At dinner, but done at 10:00", isOnline: true))
        cohort.addFriend(Friend(name: "Emily", status: .Free, isOnline: true))
        cohort.addFriend(Friend(name: "Jason", status: .Busy))
        cohort.addFriend(Friend(name: "SF friend 4"))
        cohort.addFriend(Friend(name: "SF friend 5"))
        friends.addCohort(cohort)
        }
    }
    //
    // End Dummy DB
    //******
    
    
    // MARK: Properties
    let reuseID = "friendID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleFriends()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Use the edit button item provided by the table view controller.
       // navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return friends.count()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return friends.getCohort(section).count()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cohort = friends.getCohort(section)
        return cohort.title + "  (\(cohort.countOnline())/\(cohort.count()))"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseID, forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        let friend = friends.getCohort(indexPath.section).getFriend(indexPath.row)
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.whatsDoing
        if friend.isOnline {
            cell.imageView?.image = UIImage(named: "Green Button")
        } else {
            cell.imageView?.image = UIImage(named: "Red Button")
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            friends.getCohort(indexPath.section).dropFriend(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            var newFriend = Friend(name: "new friend")
            friends.getCohort(indexPath.section).addFriend(newFriend)
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        // Remove from old location
        var oldCohort = friends.getCohort(fromIndexPath.section)
        var friend = oldCohort.dropFriend(fromIndexPath.row)

        // Add to new location
        friends.getCohort(toIndexPath.section).addFriend(friend, index: toIndexPath.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
