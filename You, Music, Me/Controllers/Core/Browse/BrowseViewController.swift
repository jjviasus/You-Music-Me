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
    
    var user: User?
    var suggestedUsers: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
        
        let tabBarVC = tabBarController as! TabBarViewController
        user = tabBarVC.user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // network call to retrive other users with similar favorite artists
        
        // for now, set use dummy data
        suggestedUsers = []
    }
}
