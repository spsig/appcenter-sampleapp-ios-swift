//
//  MasterViewController.swift
//  test123
//
//  Created by Tina on 2017-06-19.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    
    // construct Data Model array, manually added for now
    var beacons: [Beacon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.beacons.append(Beacon(name: "Build", type: BeaconType.Build))
        self.beacons.append(Beacon(name: "Test", type: BeaconType.Test))
        self.beacons.append(Beacon(name: "Distribute", type: BeaconType.Distribute))
        self.beacons.append(Beacon(name: "Crash", type: BeaconType.Crash))
        self.beacons.append(Beacon(name: "Analytics", type: BeaconType.Analytics))
        self.beacons.append(Beacon(name: "Push", type: BeaconType.Push))
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beacons.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        switch row {
        case 3:
            self.performSegue(withIdentifier: "showCrash", sender: nil)
        case 4:
            self.performSegue(withIdentifier: "showAnalytics", sender: nil)
        default:
            self.performSegue(withIdentifier: "showDetail", sender: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let beacon = self.beacons[indexPath.row]
        cell.textLabel?.text = beacon.name
        
        // Configure cell
        return cell
    }
    


    
}

