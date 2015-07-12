//
//  FakeAddressBook.swift
//  Status1.2
//
//  Created by Micah Stone on 7/8/15.
//  Copyright © 2015 Micah Stone. All rights reserved.
//
import UIKit

class FakeAddressBook: UITableViewController {
    
    
    var peopleNames = ["Nicholas Larus-Stone", "Jeremy Larus", "Mom", "Dad", "Hoon Ra", "Gabi Quart", "Kevin Kennedy", "Chris Pigott", "Billy Crutcher", "Adam Coppel", "Q", "Tim Firman", "Allegra Roberts", "MJ"]
    
    var peopleStatus = ["offline.png", "online.png", "online.png", "offline.png", "offline.png", "online.png","offline.png", "offline.png", "online.png", "online.png", "online.png", "online.png", "offline.png", "offline.png"]
    
    var mystatus = ["'What's up?'"]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // Return the number of rows in the section.
        return self.peopleNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        // Configure the cell...
        if indexPath.row == 0{
            cell.nameLabel.text = "You!"
            cell.thumbnailImageView.image = UIImage(named: "online.png")
            cell.typeLabel.text = mystatus[0]
        }
        else{
        cell.nameLabel.text = peopleNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: peopleStatus[indexPath.row])
        cell.typeLabel.text = ""
        //cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        //cell.thumbnailImageView.clipsToBounds = true
        }
        return cell}
    
    
     override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        // Display the menu
        self.presentViewController(optionMenu, animated: true, completion: nil)
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the, call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call " + "(605) 906-1978", style:
            UIAlertActionStyle.Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        }
    




}

