//
//  ViewController.swift
//  StormViewer
//
//  Created by Marc Jacques on 10/26/19.
//  Copyright © 2019 Marc Jacques. All rights reserved.
//

import UIKit

class StormViewerTableViewController: UITableViewController {
    
    // MARK: - Properties
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let fm = FileManager.default //fileManager allows us to work through the filesystem and will allow us to look through the files in this app.
        let path = Bundle.main.resourcePath!// this lets us have a direct path to our file bundle given from the file manager
        let items = try! fm.contentsOfDirectory(atPath: path)// items allows us to work with the selected file manager and our specifc path to begin going through the files
        
        for items in items {
            if items.hasPrefix("nssl") {
                //this for loop loops through all the files in our desired path to load the pictures
                //the if clause helps locate the specifc files that  have a specific prefix
                pictures.append(items)
                print(pictures)
            }
        }
        // Do any additional setup after loading the view.
    }


}

