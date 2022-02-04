//
//  BrowseViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/29/22.
//

import Foundation
import UIKit

// Displays suggested users to either accept or decline
class BrowseViewController: UIViewController {
    
    var user: User!
    var suggestUsers: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
    }
}
