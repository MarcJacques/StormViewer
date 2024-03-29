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
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Storm Viewer"
        
        let fm = FileManager.default //fileManager allows us to work through the filesystem and will allow us to look through the files in this app.
        let path = Bundle.main.resourcePath!// this lets us have a direct path to our file bundle given from the file manager
        let items = try! fm.contentsOfDirectory(atPath: path)// items allows us to work with the selected file manager and our specifc path to begin going through the files
        
        for items in items {
            if items.hasPrefix("nssl") {
                //this for-loop loops through all the files in our desired path to load the pictures
                //the if clause helps locate the specifc files that  have a specific prefix
                pictures.append(items)
                pictures.sort()
                print(pictures)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Setup Table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count // send back the number of pictures in our array as the  umber of rows on our table.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// this method creates a TableViewCell
        //indexpath = is exactly whichrow, this is how we specify the row by section and row number. We don't have multiple sections, so we really only care about rows in this case.
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) //specificy a specific cell
        cell.textLabel?.text = pictures[indexPath.row]//what the cell contains
        return cell// this is the cell we created from line 41 & 42
    }
    
    func findIndex( searchValue: String) -> Int {
        var count = 0
        for index in pictures {
            count += 1
            if index == searchValue {
            print("count = \(count)")
                break
            }
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1: load StormDetailViewController
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? StormDetailViewController {
            //2: Set the selectedImage to a picture in arrays
            vc.selectedImage = pictures[indexPath.row]
            let index = findIndex(searchValue: pictures[indexPath.row])
           vc.pictureCount = "\(index) of \(pictures.count)"
            //3: Show the new VC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
}

