//
//  ViewController.swift
//  StormViewer
//
//  Created by Marc Jacques on 10/26/19.
//  Copyright © 2019 Marc Jacques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for items in items {
            if items.hasPrefix("nssl") {
                //this loads the picture
            }
        }
        // Do any additional setup after loading the view.
    }


}

