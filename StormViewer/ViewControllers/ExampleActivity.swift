//
//  ExampleActivity.swift
//  StormViewer
//
//  Created by Marc Jacques on 11/20/19.
//  Copyright © 2019 Marc Jacques. All rights reserved.
//

import Foundation
import UIKit

class ExampleActivity: UIActivity {
    var _activityTitle: String
    var _activityImage: UIImage?
    var activityItems = [Any]()
    var action: ([Any]) -> Void
    
    init(title: String, image: UIImage?, performAction: @escaping ([Any]) -> Void) {
        _activityTitle = title
        _activityImage = image
        action = performAction
        super.init()
    }
    override var activityTitle: String? {
        return _activityTitle
    }
    override var activityImage: UIImage? {
        return _activityImage
    }
}
