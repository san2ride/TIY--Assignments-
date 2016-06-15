//
//  HeroTableViewController.swift
//  HeroApp
//
//  Created by don't touch me on 6/15/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController {
    
    var herosArray = [Hero]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let luke = Hero(name: "Luke", imageName: "skywalker")
        self.herosArray.append(luke)
        
        let vader = Hero(name: "Vader", imageName: "vader")
        self.herosArray.append(vader)
        
        let kenobi = Hero(name: "Obi-wan", imageName: "kenobi")
        self.herosArray.append(kenobi)
        
        let leia = Hero(name: "Leia", imageName: "organa")
        self.herosArray.append(leia)
        
        let captain = Hero(name: "Captain", imageName: "tarkin")
        self.herosArray.append(captain)
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.herosArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HeroTableViewCell
        
            let hero = self.herosArray[indexPath.row]
        
            cell.nameLabel.text = hero.name
        
            cell.heroImageView.image = UIImage(named: hero.imageName)


            return cell
        
    
    }
}